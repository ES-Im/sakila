package com.example.sakila.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.mapper.ActorFileMapper;
import com.example.sakila.mapper.ActorMapper;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.ActorFile;
import com.example.sakila.vo.ActorForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class ActorService {
	@Autowired
	ActorFileMapper actorFileMapper;
	@Autowired
	ActorMapper actorMapper;

	public Actor getActorOne(int actorId) {
		return actorMapper.selectActorOne(actorId);
	}


	public void addActor(ActorForm actorForm, String path) {
		// (1-1) create Actor instance - firstName / LastName
		Actor actor = new Actor();
		actor.setFirstName(actorForm.getFirstName());
		actor.setLastName(actorForm.getLastName());

		// (1-2) create Actor instance - Actor_id(AutoIncreament)
		// After setting Actor_id by selectKey, get and save var by getId()
		int checkSuccess = actorMapper.insertActor(actor); // above 1 = success -> setId() by selectKey

		actor.getActorId();
		int newActorId = actor.getActorId();

		if (checkSuccess == 1 && actorForm.getActorFile() != null) {
			// file = List
			List<MultipartFile> list = actorForm.getActorFile();

			for (MultipartFile mf : list) {
				ActorFile actorFile = new ActorFile();
				// (2-1) create actorFile instance
				actorFile.setActorId(newActorId);
				actorFile.setContentType(mf.getContentType());
				actorFile.setSize(mf.getSize());

				// (2-2) FileName, EXT, OriginFileName
				String originFileFullName = mf.getOriginalFilename();
				int dotIndex = originFileFullName.lastIndexOf(".");

				String filename = UUID.randomUUID().toString().replace("-", "");
				String orginName = originFileFullName.substring(0, dotIndex);
				String ext = originFileFullName.substring(dotIndex + 1);

				actorFile.setFileName(filename);
				actorFile.setOriginName(orginName);
				actorFile.setExt(ext);
				int checkSuccess2 = actorFileMapper.insertActorFile(actorFile);
				if (checkSuccess2 == 1) {
					// upload File
					// paramPath = request.getRealPath("/upload")

					try {
						mf.transferTo(new File(path + filename + "." + ext));
					} catch (Exception e) {
						e.printStackTrace();
						throw new RuntimeException();
					}

				}
			}
		}

	}

	public List<Actor> getActorList(int currentPage, int rowPerPage, String searchWord) {
		Map<String, Object> paramMap = new HashMap<>();
		int beginRow = (currentPage - 1) * rowPerPage;

		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);

		return actorMapper.selectActorList(paramMap);
	}

	public int getLastPage(int rowPerPage, String searchWord) {
		int totalRow = actorMapper.selectTotalCount(searchWord);
		int lastPage = totalRow / rowPerPage;
		if (totalRow % rowPerPage != 0) {
			lastPage++;
		}
		return lastPage;
	}
}
