package com.example.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.ActorFile;
import com.example.sakila.vo.ActorForm;
@Mapper
public interface ActorFileMapper {
	List<ActorFile> selectActorFileListByActor(int actorId);
	int insertActorFile(ActorFile actorFile);
	
	// on/ActorOne-deleteActorFile - 파일 하나만 지우기(파일 넘버가 인자로 넘어올때), 파일 전부다 지우기 (파일 넘버가 인자로 넘어오지 않으면)
	int deleteActorFile(ActorFile actorFile);
	
	// on/actorOne-dleteActorFile, 파일 물리적 삭제를 위함
	ActorFile selectActorFileOne(int actorFileId);
	

	
}
