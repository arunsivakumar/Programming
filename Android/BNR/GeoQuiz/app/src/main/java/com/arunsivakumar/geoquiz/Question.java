package com.arunsivakumar.geoquiz;

/**
 * Created by Arun on 6/6/17.
 */

public class Question {

    private int mTextResId;
    private boolean mAnswerTrue;
    private boolean mUserAnswered;

   public Question(int textResId,boolean answerTrue){
       mTextResId = textResId;
       mAnswerTrue = answerTrue;
   }

    public int getTextResId() {
        return mTextResId;
    }

    public void setTextResId(int textResId) {
        mTextResId = textResId;
    }

    public boolean isAnswerTrue() {
        return mAnswerTrue;
    }

    public void setAnswerTrue(boolean answerTrue) {
        mAnswerTrue = answerTrue;
    }

    public boolean isUserAnswered() {
        return mUserAnswered;
    }

    public void setUserAnswered(boolean userAnswered) {
        mUserAnswered = userAnswered;
    }
}
