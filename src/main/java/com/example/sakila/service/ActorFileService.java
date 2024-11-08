package com.example.sakila.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.mapper.ActorFileMapper;
import com.example.sakila.mapper.FilmMapper;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.ActorFile;
import com.example.sakila.vo.ActorForm;

@Service
@Transactional
public class ActorFileService {
	@Autowired ActorFileMapper actorFileMapper;
	
	// /on/actorOne
	public List<ActorFile> getActorFileListByActor(int actorId) {
		return actorFileMapper.selectActorFileListByActor(actorId);
	}
	
	// /on/addActorFile
	public void addActorFile(ActorForm actorForm, String path) {
		 if(actorForm.getActorFile() != null) {
			List<MultipartFile> list = actorForm.getActorFile();
	
			for (MultipartFile mf : list) {
				// (2-1) create actorFile instance
				ActorFile actorFile = new ActorFile();
				
				actorFile.setActorId(actorForm.getActorId());
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
	
	// /on/removeActorFile) actor_file 삭제 + 물리적으로 삭제(fileName, Path필요)
	public void removeActorFile(int actorFileId, String path) {
		ActorFile actorFile = actorFileMapper.selectActorFileOne(actorFileId);
		int row = actorFileMapper.deleteActorFile(actorFile);
		
		if(row == 1) {
			String fileFullName = path + actorFile.getFileName()+"."+actorFile.getExt();
			File file = new File(fileFullName);
			file.delete();
		}
	}
}



