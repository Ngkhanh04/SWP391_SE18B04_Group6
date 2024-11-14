
package model;


public class Team {
    private int teamId;
    private String teamName;
    private int userId;

    public Team(int teamId, String teamName, int userId) {
        this.teamId = teamId;
        this.teamName = teamName;
        this.userId = userId;
    }

    public Team(String teamName, int userId) {
        this.teamName = teamName;
        this.userId = userId;
    }

    public Team() {
    }
    
    // Getters and Setters
    public int getTeamId() {
        return teamId;
    }

    public void setTeamId(int teamId) {
        this.teamId = teamId;
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

    @Override
    public String toString() {
        return "Team{" +
                "teamId=" + teamId +
                ", teamName='" + teamName + '\'' +
                ", userId=" + userId +
                '}';
    }
}
