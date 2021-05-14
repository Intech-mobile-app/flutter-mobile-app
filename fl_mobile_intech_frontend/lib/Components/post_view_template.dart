import 'package:fl_mobile_intech/Screens/Home/comments_screen.dart';
import 'package:fl_mobile_intech/export.dart';

Widget postViewTemplate(
  name,
  houseNo,
  title,
  text,
  postImages,
  comments,
  profGesture,
  postGesture,
  context,
  postId,
  authToken,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      GestureDetector(
        onTap: () => profGesture,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              radius: 25,
              child: FlutterLogo(
                size: 40,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$name',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  '$houseNo',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            Spacer(),
            Icon(
              Icons.more_vert_outlined,
              color: Colors.black,
              size: 25,
            ),
          ],
        ),
      ),
      SizedBox(
        height: 15,
      ),
      GestureDetector(
        onTap: () => postGesture == true
            ? Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CommentsScreen(
                    postId: postId,
                    authToken: authToken,
                  ),
                ),
              )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$title',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '$text',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w100,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            postImages != null
                ? SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: postImages.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                15,
                              ),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                postImages[index],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 10,
                        );
                      },
                    ),
                  )
                : Container(),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Spacer(),
                Text(
                  '${comments.length} Comments',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.question_answer_outlined,
                  size: 22,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              height: 1,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    ],
  );
}
