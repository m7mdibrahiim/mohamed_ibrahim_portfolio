enum ProjectLinkType { apk, website, github, demo, file }

class ProjectLinkModel {
  const ProjectLinkModel({
    required this.labelEn,
    required this.labelAr,
    required this.url,
    required this.type,
  });

  final String labelEn;
  final String labelAr;
  final String url;
  final ProjectLinkType type;
}
