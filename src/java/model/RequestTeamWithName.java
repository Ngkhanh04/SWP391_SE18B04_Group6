/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author hokha
 */
public class RequestTeamWithName {
    private RequestTeam requestTeam;
    private String teamName;
    private int userId;

    // Constructor
    public RequestTeamWithName(RequestTeam requestTeam, String teamName, int userId) {
        this.requestTeam = requestTeam;
        this.teamName = teamName;
        this.userId = userId;
    }

    // Getters and Setters
    public RequestTeam getRequestTeam() {
        return requestTeam;
    }

    public void setRequestTeam(RequestTeam requestTeam) {
        this.requestTeam = requestTeam;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    
}

