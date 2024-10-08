enum MiniAppTargetActionType {
  homeCareDetail,
  homeCareJobCreateDefect,
  unsupported;

  static MiniAppTargetActionType fromString(String text) {
    switch (text) {
      case 'HOME_CARE_DETAIL':
        return MiniAppTargetActionType.homeCareDetail;
      case 'HOME_CARE_JOB_CREATE_DEFECT':
        return MiniAppTargetActionType.homeCareJobCreateDefect;
      default:
        return MiniAppTargetActionType.unsupported;
    }
  }
}
