import 'package:flutter/material.dart';
class MusicList extends StatefulWidget {
  const MusicList({super.key});

  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {

  List Songs=[
    {
      "name":"Cyberpunk",
      "thumbnail":"https://i.scdn.co/image/ab67616d0000b2735f25557396eccc8f2cbbd8b8",
      "path":"audio/cyberpunk.mp3",
      "artist":"Rosa Walton",
      "genre":"Romance"
    },
    {
      "name":"No Lie",
      "thumbnail":"https://i1.sndcdn.com/artworks-000237981513-ok2het-t500x500.jpg",
      "path":"audio/Nolie.mp3",
      "artist":"Dua Lipa",
      "genre":"Romance"
    },
    {
      "name":"Dusk till dawn",
      "thumbnail":"https://i.pinimg.com/564x/2d/da/3b/2dda3bf6db07715dae01930b6d13c46d.jpg",
      "path":"audio/Dusktilldawn.mp3",
      "artist":"Zayn",
      "genre":"Romance"
    },
    {
      "name":"Genius",
      "thumbnail":"https://i.scdn.co/image/ab67616d0000b2733f159ae07dd556323f39f47b",
      "path":"audio/Genius.mp3",
      "artist":"Sia",
      "genre":"Physco"
    },
    {
      "name":"House of memories",
      "thumbnail":"https://c.saavncdn.com/787/Memories-English-2018-20180420171446-500x500.jpg",
      "path":"audio/Houseofmemories.mp3",
      "artist":"Panic",
      "genre":"Thriller"
    },
    {
      "name":"Heatwaves",
      "thumbnail":"https://i.scdn.co/image/ab67616d0000b273ab9d1ae18b640b7b0ce390d4",
      "path":"audio/Heatwaves.mp3",
      "artist":"Glass animals",
      "genre":"Romance"
    },
    {
      "name":"We don't talk anymore",
      "thumbnail":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPoFoXhRXyvXmFn-N6NyjDOaxcXMxqMHd4GA&usqp=CAU",
      "path":"audio/collab.mp3",
      "artist":"Charlie Puth,Gomez",
      "genre":"Romance,Melody"
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music List"),
        
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: Songs.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Image.network(Songs[index]["thumbnail"],width: 60,),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Songs[index]["name"],
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      ),),
                    Text(Songs[index]["artist"],textAlign: TextAlign.left,)
                  ],
                ),
                CircleAvatar(
                  child: IconButton(onPressed: (){
                    Navigator.pushNamed(context, "/player",arguments: {'index':index});
                  }, icon: Icon(Icons.play_arrow)),
                )
              ]),
            );
          }
          ),
      ),
     
    );
  }
}