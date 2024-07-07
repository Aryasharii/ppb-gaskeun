import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommentPage extends StatefulWidget {
  final String imagePath;
  final String productId;

  const CommentPage(
      {Key? key, required this.imagePath, required this.productId})
      : super(key: key);

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  late TextEditingController _commentController;
  List<String> _comments = [];

  @override
  void initState() {
    super.initState();
    _commentController = TextEditingController();
    _loadSavedComments();
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _loadSavedComments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _comments = prefs.getStringList('${widget.productId}_comments') ?? [];
    });
  }

  Future<void> _saveComments(List<String> comments) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('${widget.productId}_comments', comments);
  }

  void _handleSubmit() {
    String comment = _commentController.text.trim();
    if (comment.isNotEmpty) {
      setState(() {
        _comments.add(comment);
        _saveComments(_comments);
      });
      _commentController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.imagePath,
              height: 300,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  hintText: "Add your comment...",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ),
            ElevatedButton(
              onPressed: _handleSubmit,
              child: Text("Submit"),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _comments.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_comments[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
