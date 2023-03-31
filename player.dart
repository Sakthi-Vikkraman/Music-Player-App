import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {

    List Songs=[
    {
      "name":"Cyberpunk",
      "thumbnail":"https://i.ytimg.com/vi/R0di5GVDKMU/maxresdefault.jpg ",
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

  final audioPlayer=AudioPlayer();
  bool isPlaying=false;
  Duration duration=Duration.zero;
  Duration position=Duration.zero;
  var i=null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) { 

      setState(() {
         isPlaying = state==PlayerState.playing;
      });
       
      
    });

    audioPlayer.onPositionChanged.listen((pos) {

      setState(() {
        position=pos;
      });
        
    });

    audioPlayer.onDurationChanged.listen((dur) {
      setState(() {
        duration=dur;
      });
     });


  }


  Future setAudio() async {

      await audioPlayer.play(AssetSource(Songs[i??0]["path"]));

  }


  
  @override
  Widget build(BuildContext context) {
    final routes=ModalRoute.of(context)?.settings.arguments as Map<String,int>;

     i=routes['index']?.toInt();

    return Scaffold(
      appBar: AppBar(
        title: Text("Music Player"),
        
      ),
      body: Container(
        color: Colors.grey,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
              padding: EdgeInsets.all(20),
              child: Image.network(Songs[i??0]["thumbnail"])
              ),
              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(), 
                onChanged: (value) async {

                    print(value);

                  await audioPlayer.seek(Duration(microseconds: (value * 1000).toInt()));
                }
                ),
                CircleAvatar(
                  child: IconButton(
                    onPressed: () async {
                      if(isPlaying==false)
                      {
                        await audioPlayer.resume();
                      }
                      else 
                      {
                        await audioPlayer.pause();
                      }
                    }, 
                    icon: isPlaying==false?Icon(Icons.play_arrow):Icon(Icons.pause),
                ))
          ],
        ),
      ),
    );
  }
}