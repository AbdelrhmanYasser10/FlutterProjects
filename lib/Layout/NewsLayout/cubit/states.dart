abstract class NewsStates{}

class NewsInitialState extends NewsStates{}

class NewsBottomState extends NewsStates{}

class NewsChangeNav extends NewsStates{}

class BusinessLoadingNewsState extends NewsStates{}

class SportsLoadingNewsState extends NewsStates{}

class ScienceLoadingNewsState extends NewsStates{}


class GetBusinessNewsSuccessState extends NewsStates{}
class GetSportsNewsSuccessState extends NewsStates{}
class GetScienceNewsSuccessState extends NewsStates{}


class GetBusinessNewsErrorState extends NewsStates{
  final String error;

  GetBusinessNewsErrorState(this.error);
}

class GetSportsNewsErrorState extends NewsStates{
  final String error;

  GetSportsNewsErrorState(this.error);
}

class GetScienceNewsErrorState extends NewsStates{
  final String error;

  GetScienceNewsErrorState(this.error);
}

