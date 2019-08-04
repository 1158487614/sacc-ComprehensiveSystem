package com.sacc.comprehensivesystem.modules.assignment.dto;

import com.sacc.comprehensivesystem.common.enums.*;

/**
 * 作业全部题目列表的单项
 * @author goufaan
 */
public class QuestionListItem {
    private Long id;
    private String title;
    private Difficulty difficulty;
    private QuestionType questionType;
    private Boolean finish;

    public Long getId() {
        return id;
    }

    public QuestionListItem setId(Long id) {
        this.id = id;
        return this;
    }

    public String getTitle() {
        return title;
    }

    public QuestionListItem setTitle(String title) {
        this.title = title;
        return this;
    }

    public Difficulty getDifficulty() {
        return difficulty;
    }

    public QuestionListItem setDifficulty(Difficulty difficulty) {
        this.difficulty = difficulty;
        return this;
    }

    public QuestionType getQuestionType() {
        return questionType;
    }

    public QuestionListItem setQuestionType(QuestionType questionType) {
        this.questionType = questionType;
        return this;
    }

    public Boolean getFinish() {
        return finish;
    }

    public QuestionListItem setFinish(Boolean finish) {
        this.finish = finish;
        return this;
    }
}