import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

  final user =FirebaseAuth.instance.currentUser!;

  //sign user out function
  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.yellow,
        title: Row(
          children: [
            Icon(Icons.android,size: 35,color: Colors.deepPurpleAccent,),
            SizedBox(width: 20,),
            Text("Confidential Tech",
            style: TextStyle(color:Colors.black),),
          ],
        ),
        actions:[
        IconButton(onPressed: signUserOut,icon: Icon(Icons.logout,color: Colors.deepPurpleAccent,),)
        ],
      ),

      body: Container(
                      decoration: const BoxDecoration(
                          gradient: SweepGradient(
                              center: Alignment.center, colors: [Colors.green, Colors.yellow])),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10,),
                Text("Chat GPT",
                style: TextStyle(fontFamily: 'PlayfairDisplay',
                    color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold,
                    fontSize: 60,
                    ),
            ),
                Image.asset(
                  'lib/images/cgt.jpg',
                  height: 200,
                  width: 200,
                ),
                Text("\nChat GPT is an AI chatbot auto-generative system created"
                    " by Open AI for online customer care. It is a pre-trained generative chat, "
                    "which makes use of (NLP) Natural Language Processing. The source of its data"
                    " is textbooks, websites, and various articles, which it uses to model its "
                    "own language for responding to human interaction.This chatbot system provides"
                    " information and responses to inquiries through AI. The popular version of chat GPT is "
                    "the GPT-3 model.",
                    style:TextStyle(
                  color: Colors.black,
                        fontWeight: FontWeight.bold,
                ),),
            Text("\n\nFeatures of Chat GPT",
              style:TextStyle(
                color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20,
              ),),
                Text("\nThe main feature of Chat GPT is generating "
                    "responses like those humans would provide, in a text box. Therefore, it is suitable"
                    " for chatbots, AI system conversations, and virtual assistants. It can also give natural"
                    " answers to questions in a conversational tone, and can generate stories and poems. Moreover, "
                    "Chat GPT can;Write a codeWrite an articlesTranslateDebuggingWrite a story/poemTraining"
                    " Sources Chat GPT relies on NLP (Natural Language Processing). It’s an excellent "
                    "tool for researchers and developers working on various NLP projects, and it has many "
                    "specific tasks, domains, and applications available to work within. In fact, it "
                    "is well-trained on biased and unbiased data, so much so that Chat GPT can"
                    " reproduce data outputs and clear reliability – crucial for many sensitive "
                    "apps and other valuable Al systems. As humans we are, more and more, "
                    "interacting with Al-powered machines, and Chat GPT is a revolution in"
                    " the field of Al. It is a robust model and particularly advanced "
                    "thanks to its deep-learning capabilities and NLP. Ultimately, "
                    "it can generate human-like answers and is easily understandable to users.",
              style:TextStyle(
                color: Colors.black,
              ),),
               Text( "\n\n"
                    "Registration for Chat GPT",style:TextStyle(
                 color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20,
               ),),
                Text("\nTo register to Chat GPT, you can use one of your "
                    "existing email IDs and mobile number and then follow these easy steps to get "
                    "registration done. Take note that Chat GPT price options now include a "
                    "professional plan, should you need consistent, unfettered access.",
                  style:TextStyle(
                    color: Colors.black,
                  ),),
                Text("\n\nThe "
                    "following are the steps:",
                  style:TextStyle(
                    color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20,
                  ),),
                Text("\nGo to the login page in a browser.Create "
                    "an AI account, click on sign up and enter your email id; for example, "
                    "if you have a Gmail id and then click on Google, it automatically "
                    "registers to your Google account.Then next, press the continue button, and it "
                    "asks for your mobile number for verification.Then you receive a code on your"
                    " mobile number, and it may charge you to get a code.Go to sms activation."
                    " Register and log inIn the up-right corner, under the balance, select the top-up "
                    "balance option to recharge.Scrolling down at the end, you have some options. "
                    "Click to recharge.After recharging, go back to the home page and find Al services "
                    "in the search box.Press the shopping cart button. Your country code mobile number"
                    " is mentioned.Copy that mobile number and enter it in the Chat GPT mobile number "
                    "verification section. Send code via sms.You receive a code. That’s your verification"
                    " code. Enter this code in the Open AI box to complete the process.Choose the main"
                    " reason why you register it. Such as, I am using it to explore features.In case of"
                    " failure, change the mobile number of another country and then try again."
                    "What is a GPT-3 chat bot?GPT-3 chatbots are bots are artificial intelligence "
                    "applications that can be programmed to engage in natural human-like communication."
                    " They can provide impressive engagement and usefulness thanks to development "
                    "using engines, here specifically OpenAI’s GPT-3, which enables training in written"
                    " and spoken human language.GPT-3 chatbot applications make use of deep learning and "
                    "other techniques, targeted toward the understanding of language and linguistic"
                    " models. This enables communication almost indistinguishable from human conversation,"
                    " and has implementations where it can be far more useful than regular chat bots"
                    " – customer services, for example.",
                  style:TextStyle(
                    color: Colors.black,
                  ),),

                    Text("\n\nFinal thoughts",style:TextStyle(
                      color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20,
                    ),),
                       Text( "\nChat GPT has been famous since its release and is set to"
                           " revolutionize the tech world. All you have to do is go to OpenAI’s "
                           "Chat GPT website and use it in your browser to test it for free.There "
                           "is no specific app to use and you can use it on desktop and mobile"
                           " websites. You just need to make an account and then use it for whatever"
                           " you need. Be that for personal growth, expanded research, or something"
                           " else. There are alternatives too, but Chat GPT is in the limelight for"
                           " now!",
                style:TextStyle(
                    color: Colors.black,
                ),),
                ],),
          ),

          ),
        ),
      ),

    );
  }
}
