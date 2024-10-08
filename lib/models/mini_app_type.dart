enum MiniAppType {
  homeCare,
  homeCareJobCreateDefect,
  unsupported;

  static MiniAppType fromString(String text) {
    switch (text) {
      case 'HOME_CARE':
        return MiniAppType.homeCare;
      case 'HOME_CARE_JOB_CREATE_DEFECT':
        return MiniAppType.homeCareJobCreateDefect;
      default:
        return MiniAppType.unsupported;
    }
  }

  String get description {
    switch (this) {
      case MiniAppType.homeCare:
        return 'ดูรายละเอียด';
      case MiniAppType.homeCareJobCreateDefect:
        return 'เปิดใบงานใหม่';
      default:
        return 'unsupported';
    }
  }
}
