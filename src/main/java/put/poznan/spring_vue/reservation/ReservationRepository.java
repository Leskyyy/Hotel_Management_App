package put.poznan.spring_vue.reservation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import put.poznan.spring_vue.address.Address;
import put.poznan.spring_vue.guest.Guest;
import put.poznan.spring_vue.hotel.Hotel;
import put.poznan.spring_vue.reservation.Reservation;
import put.poznan.spring_vue.room.Room;

public interface ReservationRepository extends JpaRepository<ReservationRepository, Long> {

    @Query("SELECT ht FROM Hotel ht WHERE ht.id = :ht_id")
    Hotel findHotelByID(@Param("ht_id") int ht_id);

    @Query("SELECT rs FROM Reservation rs WHERE rs.id = :rs_id")
    Reservation findReservationByID(@Param("rs_id") int rs_id);

    @Query("SELECT gs FROM Guest gs WHERE gs.id = :gs_id")
    Guest findGuestByID(@Param("gs_id") int gs_id);

    @Query("SELECT ad FROM Address ad WHERE ad.id = :ad_id")
    Address findAddressByID(@Param("ad_id") int ad_id);

}