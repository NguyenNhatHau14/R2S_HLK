import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../blog/blog_detail_answer_page/detail_answer_page_bloc.dart';
import '../../../../../../components/commnet_form.dart';
import '../../../../../../data/data_modal/data_comment_modal.dart';
import '../../../../../../utils/management_image.dart';


class ItemCommentListView extends StatefulWidget {
  const ItemCommentListView(
      {super.key, required this.listDataComment, required this.index, required this.detailAnswerPageBloc});

  final int index;
  final List<DataCommentModal> listDataComment;
  final DetailAnswerPageBloc detailAnswerPageBloc;


  @override
  State<ItemCommentListView> createState() => _ItemCommentListViewState();
}

class _ItemCommentListViewState extends State<ItemCommentListView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.detailAnswerPageBloc,
      child: CommentForm(
          avatar: ImageManagement.defaultAvatar,
          name: widget.listDataComment[widget.index].userNamePostComment,
          dayAgo: widget.listDataComment[widget.index].timePost,
          commentContent: widget.listDataComment[widget.index].contentComment),
    );
  }
}
