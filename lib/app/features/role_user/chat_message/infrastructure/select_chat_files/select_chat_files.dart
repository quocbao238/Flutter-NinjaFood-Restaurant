library select_chat_files;

import 'dart:io';

import 'package:ninjafood/app/helper/file_helper.dart';
import 'package:ninjafood/app/models/message_chat_model.dart';
import 'package:ninjafood/app/services/cloud_storage_service/cloud_storage_service.dart';

part 'select_chat_images.dart';

part 'select_chat_another_files.dart';

part 'select_chat_files_impl.dart';

part 'select_chat_video.dart';

part 'select_chat_text_only.dart';

List<SelectChatFilesImpl> lstSelectChatFiles = <SelectChatFilesImpl>[
  SelectChatImages(),
  SelectChatVideos(),
  SelectAnotherFiles(),
];
