import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movies_now/src/api/base_response.dart';

import '../models.dart';

part 'movies_response.g.dart';

@JsonSerializable(createToJson: false)
class MoviesResponse extends BaseResponse {
  int page;
  @JsonKey(name: 'results')
  List<MovieModel> movies;
  @JsonKey(name: 'total_pages')
  int totalPages;

  MoviesResponse(this.page, this.movies, this.totalPages);


  @override
  List<Object> get props => [page, movies, totalPages];

  @override
  fromJson(Map<String, dynamic> json) =>_$MoviesResponseFromJson(json);
}
