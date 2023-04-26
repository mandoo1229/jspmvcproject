package com.playdata.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.playdata.dto.BoardDto;

import javax.servlet.http.HttpServletRequest;

public class BoardDao {
    /**
     * board 테이블에서 모든 데이터를 조회
     * @param req
     * @return
     */

    public List<BoardDto> selectAll(HttpServletRequest req) {
        Connection conn = (Connection) req.getServletContext().getAttribute("conn");
        List<BoardDto> boardList = new ArrayList<>();

        try (Statement stmt = conn.createStatement()) {
            ResultSet rs = stmt.executeQuery("SELECT * FROM board ORDER BY id DESC");
            while (rs.next()) {
                BoardDto boardDto = new BoardDto(
                  rs.getInt("id"),
                  rs.getString("title"),
                  rs.getString("content"),
                  rs.getString("author"),
                  rs.getString("created_at")
                );
                boardList.add(boardDto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return boardList;
    }
}
