package com.arunsivakumar.geoquiz;

import android.app.Activity;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

public class QuizActivity extends AppCompatActivity {

  private static final String TAG = "QuizActivity";
    private static final String KEY_INDEX = "index";
private static final int REQUEST_CODE_CHEAT = 0;


    private Button mTrueButton;
    private Button mFalseButton;
    private Button mCheatButton;
    private Button mNextButton;
    private Button mPreviousButton;
    private TextView mQuestionTextView;
    private boolean mIsCheater;

    private Question[] mQuestionBank = new Question[]{
            new Question(R.string.question_oceans,true),
            new Question(R.string.question_mideast,false),
            new Question(R.string.question_africa,false),
            new Question(R.string.question_americas,true),
            new Question(R.string.question_asia,true),
    };

    private int mCurrentIndex = 0;
    private int mUserAnsweredQuestion = 0;
    private int mUserCorrectAnswer = 0;

   @Override
   protected void onActivityResult(int requestCode, int resultcode, Intent data){
       if(resultcode != Activity.RESULT_OK){
           return;
       }

       if(requestCode == REQUEST_CODE_CHEAT){
           if(data ==null){
               return;
           }
           mIsCheater = CheatActivity.wasAnswerShown(data);
       }
   }
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Log.d(TAG,"onCreate(Bundle) called");

        setContentView(R.layout.activity_quiz); // 1.inflates

        // load saved state
        if (savedInstanceState != null){
            mCurrentIndex = savedInstanceState.getInt(KEY_INDEX,0);
        }

        //2. Outlet- reference
        mTrueButton = (Button) findViewById(R.id.true_button);
        mFalseButton = (Button) findViewById(R.id.false_button);
        mCheatButton = (Button) findViewById(R.id.cheat_button);

        mNextButton = (Button) findViewById(R.id.next_button);
        mPreviousButton = (Button) findViewById(R.id.previous_button);
       mQuestionTextView = (TextView) findViewById(R.id.question_text_view);

        //3.Action - Listeners

        mCheatButton.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v){
                //start cheat activity
//                Intent intent = new Intent(QuizActivity.this,CheatActivity.class); // context & class - explicit intent

                // Intent extras to send data
                boolean answerIsTrue = mQuestionBank[mCurrentIndex].isAnswerTrue();
                Intent intent = CheatActivity.newIntent(QuizActivity.this,answerIsTrue);
//                startActivity(intent);
                startActivityForResult(intent,REQUEST_CODE_CHEAT);

            }
        });

        mTrueButton.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v){
//                Toast.makeText(QuizActivity.this, R.string.correct_toast, Toast.LENGTH_SHORT).show();
                checkAnswer(true);
            }
        });

        mFalseButton.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v){
//                Toast.makeText(QuizActivity.this, R.string.incorrect_toast, Toast.LENGTH_SHORT).show();
                checkAnswer(false);
            }
        });

        mNextButton.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v){
                    mIsCheater = false;
                mCurrentIndex = (mCurrentIndex+1) % mQuestionBank.length;
                updateQuestion();
            }
        });
        mQuestionTextView.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v){

                mCurrentIndex = (mCurrentIndex+1) % mQuestionBank.length;
                updateQuestion();
            }
        });

        mPreviousButton.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v){

                mCurrentIndex = (mCurrentIndex-1) % mQuestionBank.length;
                if (mCurrentIndex < 0){
                    mCurrentIndex = mQuestionBank.length-1;
                }
                updateQuestion();
            }
        });

        updateQuestion();
    }

    @Override
    protected void onStart() {
        super.onStart();
        Log.d(TAG, "onStart() called");
    }

    @Override
    protected void onResume() {
        super.onResume();
        Log.d(TAG, "onResume() called");
    }

    @Override
    protected void onPause() {
        super.onPause();
        Log.d(TAG, "onPause() called");
    }

    @Override
    protected void onSaveInstanceState(Bundle savedInstanceState) {
        super.onSaveInstanceState(savedInstanceState);
        Log.i(TAG, "onSaveInstanceState");
        savedInstanceState.putInt(KEY_INDEX, mCurrentIndex);
    }

    @Override
    protected void onStop() {
        super.onStop();
        Log.d(TAG, "onStop() called");
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        Log.d(TAG, "onDestroy() called");
    }
    private void updateQuestion(){

//        Log.d(TAG,"updating question text",new Exception());

        int question = mQuestionBank[mCurrentIndex].getTextResId();
        updateAnswerButtons();
        mQuestionTextView.setText(question);
    }

    private void checkAnswer(boolean userPressed){


        mUserAnsweredQuestion++;

        mQuestionBank[mCurrentIndex].setUserAnswered(true);
        updateAnswerButtons();
        checkIfUserFinishedQuiz();

        boolean answerIsTrue = mQuestionBank[mCurrentIndex].isAnswerTrue();

        int messageResId = 0;

        if(mIsCheater){
            messageResId = R.string.judgment_toast;
        }else {
            if (userPressed == answerIsTrue) {
                mUserCorrectAnswer++;
                messageResId = R.string.correct_toast;
            } else {
                messageResId = R.string.incorrect_toast;
            }
        }

        Toast.makeText(QuizActivity.this, messageResId, Toast.LENGTH_SHORT).show();
    }

    private void updateAnswerButtons(){
        if (mQuestionBank[mCurrentIndex].isUserAnswered() == true){
            //disable buttons
            mTrueButton.setEnabled(false);
            mFalseButton.setEnabled(false);
        }else{
            mTrueButton.setEnabled(true);
            mFalseButton.setEnabled(true);
        }
    }

    private void checkIfUserFinishedQuiz(){
        if (mUserAnsweredQuestion == mQuestionBank.length){
            String score = new String(((mUserCorrectAnswer / (double) mQuestionBank.length) * 100) + "%");
//            Log.i(TAG,String.valueOf(mUserCorrectAnswer));
            Toast.makeText(QuizActivity.this, score, Toast.LENGTH_SHORT).show();
        }
    }
}
