package com.sacc.comprehensivesystem.modules.team.dao;

import com.sacc.comprehensivesystem.modules.team.entity.Team;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TeamChangeDao {
    void createTeam(Team team);
    String foudByName(String name);
    Long foudByLeader(Long leaderId);
    Team returnTeam(String name);
    void updateTeamB(@Param("team_id") Long teamId, @Param("user_id") Long userId);
    void updateTeamC(@Param("team_id") Long teamId, @Param("user_id") Long userId);
    List<Team> getTeam(Long team_id);
    List<Team> getAllTeam();
}
