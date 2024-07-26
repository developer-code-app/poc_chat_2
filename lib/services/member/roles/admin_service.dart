import 'package:poc_chat_2/models/chat_room_member.dart';
import 'package:poc_chat_2/models/forms/chat_room_form.dart';
import 'package:poc_chat_2/services/member/member_service.dart';

extension AdminService on MemberService {
  Future<void> addMember({
    required ChatRoomMemberForm memberForm,
  }) async {}

  Future<void> removeMember({
    required ChatRoomMember member,
  }) async {}
}
