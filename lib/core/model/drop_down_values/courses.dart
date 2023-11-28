import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';
import 'link.dart';

part 'courses.g.dart';

@JsonSerializable()
class Courses {
	@JsonKey(name: 'current_page') 
	int? currentPage;
	List<Datum>? data;
	@JsonKey(name: 'first_page_url') 
	String? firstPageUrl;
	int? from;
	@JsonKey(name: 'last_page') 
	int? lastPage;
	@JsonKey(name: 'last_page_url') 
	String? lastPageUrl;
	List<Link>? links;
	@JsonKey(name: 'next_page_url') 
	String? nextPageUrl;
	String? path;
	@JsonKey(name: 'per_page') 
	int? perPage;
	@JsonKey(name: 'prev_page_url') 
	dynamic prevPageUrl;
	int? to;
	int? total;

	Courses({
		this.currentPage, 
		this.data, 
		this.firstPageUrl, 
		this.from, 
		this.lastPage, 
		this.lastPageUrl, 
		this.links, 
		this.nextPageUrl, 
		this.path, 
		this.perPage, 
		this.prevPageUrl, 
		this.to, 
		this.total, 
	});

	factory Courses.fromJson(Map<String, dynamic> json) {
		return _$CoursesFromJson(json);
	}

	Map<String, dynamic> toJson() => _$CoursesToJson(this);
}
