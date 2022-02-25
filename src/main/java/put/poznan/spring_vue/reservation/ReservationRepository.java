package put.poznan.spring_vue.reservation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import put.poznan.spring_vue.address.Address;
import put.poznan.spring_vue.hotel.Hotel;

import java.util.List;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {

}