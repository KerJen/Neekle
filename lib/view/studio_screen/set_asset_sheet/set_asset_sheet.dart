import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/const.dart';
import '../../../core/di/di.dart';
import '../../../core/helper/sheet_helper.dart';
import '../../../core/ui/colors.dart';
import '../../../core/ui/kit/bouncing_gesture_detector.dart';
import '../../../core/ui/kit/image.dart';
import '../../../core/ui/kit/state_button/state_button.dart';
import '../../../core/ui/kit/tags.dart';
import '../../../core/ui/text_styles.dart';
import '../../../domain/assets/entity/asset_entity.dart';
import 'cubit/cubit.dart';

class SetAssetSheet extends StatefulWidget {
  final AssetEntity? asset;

  const SetAssetSheet({
    super.key,
    required this.asset,
  });

  static Future<void> show(BuildContext context, {AssetEntity? asset}) {
    return BottomSheetHelper.show(
      context,
      (context, padding) => SetAssetSheet(asset: asset),
      isScrollControlled: true,
    );
  }

  @override
  State<SetAssetSheet> createState() => _SetAssetSheetState();
}

class _SetAssetSheetState extends State<SetAssetSheet> {
  ({File? file, String? url}) _cover = (file: null, url: null);
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  List<({File? file, String? url})> _images = [];
  final _linkController = TextEditingController();
  final _priceController = TextEditingController();
  final _categoryTextController = TextEditingController();
  List<String> _tags = [];

  @override
  void initState() {
    super.initState();

    final asset = widget.asset;
    if (asset != null) {
      _cover = (file: null, url: asset.coverUrl);
      _titleController.text = asset.title;
      _descriptionController.text = asset.description;
      _images = [...asset.imageUrls.map((url) => (file: null, url: url))];
      _categoryTextController.text = asset.category;
      _tags = [...asset.tags];
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<SetAssetCubit>(),
      child: BlocListener<SetAssetCubit, SetAssetState>(
        listener: (context, state) async {
          state.mapOrNull(
            set: (value) async {
              Future.delayed(const Duration(milliseconds: 500), () {
                context.router.pop();
              });
            },
          );
        },
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.4,
              maxHeight: MediaQuery.of(context).size.height * 0.85,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            widget.asset != null ? 'Edit asset' : 'Create asset',
                            style: title.copyWith(color: currentColorScheme(context).onBackground),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            _AssetImage(
                              height: 64,
                              width: 64,
                              image: _cover,
                              onChange: (file) async {
                                setState(() {
                                  _cover = (file: file, url: _cover.url);
                                });
                              },
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: TextField(
                                controller: _titleController,
                                decoration: const InputDecoration(
                                  hintText: 'Title',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _descriptionController,
                          decoration: const InputDecoration(hintText: 'Description'),
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Images',
                      style: large.copyWith(
                        color: currentColorScheme(context).onBackground,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 96,
                    child: ListView.separated(
                      itemCount: _images.length + 1,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return _AssetImage(
                            height: 96,
                            width: 96,
                            image: (file: null, url: null),
                            onChange: (file) {
                              setState(() {
                                _images.add((file: file, url: null));
                              });
                            },
                          );
                        }

                        return _AssetImage(
                          height: 96,
                          width: 96,
                          image: _images[index - 1],
                          onChange: (file) {
                            setState(() {
                              _images[index - 1] = (file: file, url: _images[index - 1].url);
                            });
                          },
                          onRemove: () {
                            setState(() {
                              _images.removeAt(index - 1);
                            });
                          },
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(width: 16),
                    ),
                  ),
                  const SizedBox(height: 32),
                  if (widget.asset == null) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Link',
                            style: large.copyWith(
                              color: currentColorScheme(context).onBackground,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text('You can\'t change it later'),
                          const SizedBox(height: 16),
                          TextField(
                            controller: _linkController,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.add_link),
                              hintText: 'Link',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                  if (widget.asset == null) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price',
                            style: large.copyWith(
                              color: currentColorScheme(context).onBackground,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text('You can\'t change it later'),
                          const SizedBox(height: 16),
                          TextField(
                            controller: _priceController,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(10),
                                child: SvgPicture.asset(
                                  ethereumIcon,
                                  color: currentColorScheme(context).onSurface,
                                ),
                              ),
                              hintText: 'Price',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Category',
                          style: large.copyWith(
                            color: currentColorScheme(context).onBackground,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text('Category is a list of assets you can choose in the feed'),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _categoryTextController,
                          decoration: const InputDecoration(
                            hintText: 'Category',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tags',
                          style: large.copyWith(
                            color: currentColorScheme(context).onBackground,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _TagsTextField(
                          availableGenres: ['Code', 'Theme', 'Plugin'],
                          genres: _tags,
                          onChanged: (genres) {
                            setState(() {
                              _tags = genres;
                            });
                          },
                          onRemoved: (index) {
                            setState(() {
                              _tags.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  BlocBuilder<SetAssetCubit, SetAssetState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: StateButton(
                          height: 42,
                          color: currentColorScheme(context).secondaryContainer,
                          onPressed: () async {
                            final modifiedAsset = widget.asset ?? AssetEntity.empty();

                            AssetEntity asset = modifiedAsset.copyWith(
                              title: _titleController.text,
                              description: _descriptionController.text,
                              category: _categoryTextController.text,
                              tags: _tags,
                            );

                            if (widget.asset != null) {
                              context.read<SetAssetCubit>().editAsset(
                                    coverFile: _cover.file,
                                    images: _images,
                                    modifiedAsset: asset,
                                  );
                            } else {
                              asset = asset.copyWith(
                                price: double.parse(_priceController.text.replaceFirst(',', '.')),
                              );

                              context.read<SetAssetCubit>().createAsset(
                                    coverFile: _cover.file,
                                    images: _images,
                                    link: _linkController.text,
                                    modifiedAsset: asset,
                                  );
                            }
                          },
                          state: state.maybeMap(loading: (value) {
                            return StateButtonState.loading(color: currentColorScheme(context).onBackground);
                          }, set: (value) {
                            return StateButtonState.success(
                              child: Icon(
                                Icons.done,
                                color: currentColorScheme(context).primary,
                              ),
                            );
                          }, failure: (value) {
                            return const StateButtonState.failed(message: 'Error');
                          }, orElse: () {
                            return StateButtonState.base(
                              child: Text(
                                widget.asset != null ? 'Save' : 'Create',
                                style: medium.copyWith(color: currentColorScheme(context).primary),
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AssetImage extends StatelessWidget {
  final double height;
  final double width;
  final ({File? file, String? url}) image;
  final Function(File file) onChange;
  final VoidCallback? onRemove;

  const _AssetImage({
    required this.height,
    required this.width,
    required this.image,
    required this.onChange,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    if (image.file != null || image.url != null) {
      final ImageProvider provider;
      if (image.file != null) {
        provider = FileImage(image.file!);
      } else {
        provider = NetworkImage(image.url!);
      }

      return BouncingGestureDetector(
        onTap: _pickImage,
        child: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              AppImage(
                height: height,
                width: width,
                borderRadius: BorderRadius.circular(8),
                image: provider,
              ),
              if (onRemove != null)
                Align(
                  alignment: Alignment.topRight,
                  child: BouncingGestureDetector(
                    onTap: onRemove,
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: currentColorScheme(context).surface),
                      child: const Icon(
                        Icons.close,
                        size: 16,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    }

    return BouncingGestureDetector(
      onTap: _pickImage,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(
            color: currentColorScheme(context).surface,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          Icons.add_photo_alternate_outlined,
          color: currentColorScheme(context).onSurface,
        ),
      ),
    );
  }

  Future<File?> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      onChange(File(result.files.single.path!));
    }

    return null;
  }
}

class _TagsTextField extends StatelessWidget {
  final List<String> availableGenres;
  final List<String> genres;
  final Function(List<String> genres) onChanged;
  final Function(int index) onRemoved;

  const _TagsTextField({
    required this.availableGenres,
    required this.genres,
    required this.onChanged,
    required this.onRemoved,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController? searchControllerRef;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return Autocomplete(
              optionsViewBuilder: (context, onSelected, options) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Material(
                    child: Container(
                      constraints: const BoxConstraints(maxHeight: 156),
                      margin: const EdgeInsets.only(top: 16),
                      width: constraints.biggest.width,
                      decoration: BoxDecoration(
                        color: currentColorScheme(context).surfaceVariant,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: options.length,
                        itemBuilder: (context, index) {
                          final listOptions = options.toList();

                          return InkWell(
                            onTap: () {
                              onSelected(listOptions[index]);
                              onChanged([...genres, listOptions[index]]);
                              searchControllerRef?.clear();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              child: Text(
                                listOptions[index],
                                style: medium.copyWith(color: currentColorScheme(context).onBackground),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
              optionsBuilder: (textEditingValue) {
                return availableGenres
                    .where(
                      (element) => !genres.contains(element),
                    )
                    .where(
                      (element) =>
                          element.toLowerCase().contains(textEditingValue.text) && textEditingValue.text.isNotEmpty,
                    );
              },
              fieldViewBuilder: (context, searchController, focusNode, onFieldSubmitted) {
                searchControllerRef = searchController;
                return TextField(
                  focusNode: focusNode,
                  controller: searchController,
                  scrollPadding: const EdgeInsets.only(bottom: 128),
                  decoration: const InputDecoration(
                    hintText: 'Search for tags',
                  ),
                );
              },
            );
          },
        ),
        if (genres.isNotEmpty) ...[
          const SizedBox(height: 16),
          AppTags(tags: genres, onRemove: onRemoved),
        ]
      ],
    );
  }
}
