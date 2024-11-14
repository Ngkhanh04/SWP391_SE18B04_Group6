/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author hokha
 */
import java.sql.Date;

public class RequestTeam {
    private int requestTeamId;
    private String status;
    private Date bookingDate;
    private String pitchId;
    private int teamRequestId;
    private int teamMatchId;

    public RequestTeam(int requestTeamId, String status, Date bookingDate, String pitchId, int teamRequestId, int teamMatchId) {
        this.requestTeamId = requestTeamId;
        this.status = status;
        this.bookingDate = bookingDate;
        this.pitchId = pitchId;
        this.teamRequestId = teamRequestId;
        this.teamMatchId = teamMatchId;
    }

    public RequestTeam(String status, Date bookingDate, String pitchId, int teamRequestId, int teamMatchId) {
        this.status = status;
        this.bookingDate = bookingDate;
        this.pitchId = pitchId;
        this.teamRequestId = teamRequestId;
        this.teamMatchId = teamMatchId;
    }
    
    

    public RequestTeam() {
    }
    
    

    // Getters and Setters
    public int getRequestTeamId() {
        return requestTeamId;
    }

    public void setRequestTeamId(int requestTeamId) {
        this.requestTeamId = requestTeamId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

    public String getPitchId() {
        return pitchId;
    }

    public void setPitchId(String pitchId) {
        this.pitchId = pitchId;
    }

    public int getTeamRequestId() {
        return teamRequestId;
    }

    public void setTeamRequestId(int teamRequestId) {
        this.teamRequestId = teamRequestId;
    }

    public int getTeamMatchId() {
        return teamMatchId;
    }

    public void setTeamMatchId(int teamMatchId) {
        this.teamMatchId = teamMatchId;
    }

    @Override
    public String toString() {
        return "RequestTeam{" +
                "requestTeamId=" + requestTeamId +
                ", status='" + status + '\'' +
                ", bookingDate=" + bookingDate +
                ", pitchId='" + pitchId + '\'' +
                ", teamRequestId=" + teamRequestId +
                ", teamMatchId=" + teamMatchId +
                '}';
    }
}

