package com.mega.teamproject;

import org.springframework.stereotype.Controller;

import dao.GameDAO;

@Controller
public class GameController {
	GameDAO gameDao;
	public GameController(GameDAO gameDao) {
		this.gameDao = gameDao;
	}
}
