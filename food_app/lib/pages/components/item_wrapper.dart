// todo [Item Wrapper]
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemWrapper extends StatefulWidget {
  final String thumbUrl;
  final String id;
  const ItemWrapper({Key? key, required this.thumbUrl, required this.id})
      : super(key: key);

  @override
  _ItemWrapperState createState() => _ItemWrapperState();
}

class _ItemWrapperState extends State<ItemWrapper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 206,
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  child: Image(
                    image: NetworkImage('${widget.thumbUrl}'),
                    fit: BoxFit.cover,
                    height: 120,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 5,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                        color: Color(0XffEFD503),
                        borderRadius: BorderRadius.circular(3)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 13,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          '5',
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.5),
                    radius: 28,
                    child: IconButton(
                      icon: Icon(
                        Icons.play_arrow,
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '1 tiếng 20 phút',
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          color: Color(0xFF0043B3),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.favorite_border,
                        size: 16,
                      )
                    ],
                  ),
                  Text(
                    'Cách chiên trứng một cách công phu',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xFFF8F8F8),
                        radius: 20,
                        backgroundImage: NetworkImage(
                            'https://s3-alpha-sig.figma.com/img/6d9f/e2b0/ff46fd545d29ada44b78211a62a5e852?Expires=1743984000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=kuEBtQysOo0HfXSOtDUPanJHPJPwzmMnH1SOKwehOhZvIOa9P061Xh4LS4CWHrqGvykp774GbvwmpkKel7U~XEXgzSJAwjfqZ6KBL8b9F6S9TggHHTjpbSlhlawQ1SqYBHB-On3FkDW8o-TstANoRKGFqAs6Xc2brjnmUTu3oF3g11rKpI3F68uhoApT1ceA0IvIijjpXXv1J8pnlTHWvPU5AWwSyrK1oAHgI7vaogYADe-7uWZmlOf1NNGQW-fI~rJacy4nGdq51S5Zzv-JRnLS8MwkS2PQ7U-h6HXEpm7wHxGNz8D8IRuEyrSX7gqKeOq9jT-xmyaa9OJ0ugxl9g__'),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Đinh Trọng Phúc',
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFCEA700), // Màu chữ vàng
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
