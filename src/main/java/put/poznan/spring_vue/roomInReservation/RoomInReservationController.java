package put.poznan.spring_vue.roomInReservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController // This means that this class is a Controller
@RequestMapping(path="/api/roominrsv") // This means URL's start with /demo (after Application path)
public class RoomInReservationController {
    @Autowired // This means to get the bean called userRepository
    // Which is auto-generated by Spring, we will use it to handle the data
    private RoomInReservationRepository roomInReservationRepository;

//    @PostMapping(path="/add") // Map ONLY POST Requests
//    public ResponseEntity<Room> addNewRoomInReservation (@RequestBody RoomInReservationDetails roomInReservationDetails) {
//        try{
//            Room room = roomInReservationRepository.findRoomByNumber(roomInReservationDetails.getRoomNumber());
//            Hotel hotel = roomInReservationRepository.findHotelByID(roomInReservationDetails.getHotelID());
//            Reservation reservation = roomInReservationRepository.findReservationByID(roomInReservationDetails.getReservationID());
//            Guest guest = roomInReservationRepository.findGuestByID(roomInReservationDetails.getGuestID());
//
//            float roomTotalPrice = roomInReservationRepository.getFullRoomPrice()
//
//            RoomInReservation roomInReservation = new RoomInReservation(roomTotalPrice, room, hotel, reservation, guest)
//            Room _room = roomRepository.save(room);
//            return new ResponseEntity<>(_room, HttpStatus.CREATED);
//        } catch (Exception e){
//            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
//        }
//    }
}