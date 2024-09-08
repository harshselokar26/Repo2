package in.softronix.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import in.softronix.entity.User;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    static Optional<User> findByEmail(String email) {
		// TODO Auto-generated method stub
		return null;
	}
}
