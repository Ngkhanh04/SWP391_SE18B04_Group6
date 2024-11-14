package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Pitch;

/**
 *
 * @author Admin
 */
public class PitchDAO extends DBContext {

    // Get the total number of records (for pagination)
    public int getNoOfRecords() {
        try {
            String sql = "SELECT COUNT(*) AS count FROM Pitch";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt("count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Get paginated list of pitches
    public List<Pitch> getAll(int pageNumber, int pageSize) {
        List<Pitch> list = new ArrayList<>();
        String sql = "SELECT paged.pitchID, paged.pitchType, paged.status, paged.image, paged.pricePitch\n"
                   + "FROM (\n"
                   + "    SELECT *, ROW_NUMBER() OVER (ORDER BY pitchID) AS RowNum\n"
                   + "    FROM Pitch\n"
                   + ") AS paged\n"
                   + "WHERE paged.RowNum BETWEEN ? AND ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            int startRow = (pageNumber - 1) * pageSize + 1;
            int endRow = pageNumber * pageSize;
            st.setInt(1, startRow);
            st.setInt(2, endRow);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Pitch c = new Pitch(rs.getString("pitchID"), rs.getInt("pitchType"), rs.getInt("status"), rs.getString("image"), rs.getFloat("pricePitch"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    // Get pitch by ID
    public Pitch getPitchByID(String pitchID) {
        Pitch p = null;
        String sql = "SELECT pitchID, pitchType, status, image, pricePitch FROM Pitch WHERE pitchID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pitchID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                p = new Pitch(rs.getString("pitchID"), rs.getInt("pitchType"), rs.getInt("status"), rs.getString("image"), rs.getFloat("pricePitch"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return p;
    }

    // Insert a new pitch
    public void insertPitch(Pitch p) {
        String sql = "INSERT INTO Pitch (pitchID, pitchType, status, image, pricePitch) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getPitchID());
            st.setInt(2, p.getPitchType());
            st.setInt(3, p.getStatus());
            st.setString(4, p.getImage());
            st.setFloat(5, p.getPricePitch());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Update an existing pitch
    public void updatePitch(Pitch p) {
        String sql = "UPDATE Pitch SET pitchType = ?, status = ?, image = ?, pricePitch = ? WHERE pitchID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, p.getPitchType());
            st.setInt(2, p.getStatus());
            st.setString(3, p.getImage());
            st.setFloat(4, p.getPricePitch());
            st.setString(5, p.getPitchID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Delete a pitch by ID
    public void deletePitch(String pitchID) {
        String sql = "DELETE FROM Pitch WHERE pitchID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pitchID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        PitchDAO dal = new PitchDAO();
        
        // Test getting all pitches (pagination example)
        List<Pitch> list = dal.getAll(1, 5);
        for (Pitch p : list) {
            System.out.println(p.toString());
        }
        
        // Test getting a specific pitch by ID
        Pitch p = dal.getPitchByID("S5-1");
        System.out.println(p.getPricePitch());

        // Test inserting a new pitch
        Pitch newPitch = new Pitch("S5-2", 1, 1, "new_image.jpg", 100.5f);
        dal.insertPitch(newPitch);

        // Test updating an existing pitch
        newPitch.setPricePitch(200.0f); // Change price
        dal.updatePitch(newPitch);

        // Test deleting a pitch
        dal.deletePitch("S5-2");
    }
}
