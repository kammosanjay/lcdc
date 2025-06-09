class CourseType {
  List<String>? eduCourseType;

  CourseType({this.eduCourseType});

  CourseType.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null && json['data']['edu_course_type'] != null) {
      eduCourseType = List<String>.from(json['data']['edu_course_type']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['edu_course_type'] = eduCourseType;
    return data;
  }
}
