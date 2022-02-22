package put.poznan.spring_vue.room;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import put.poznan.spring_vue.hotel.Hotel;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@RestController // This means that this class is a Controller
@RequestMapping(path="/api/room") // This means URL's start with /demo (after Application path)
public class RoomController {
    @Autowired // This means to get the bean called userRepository
    // Which is auto-generated by Spring, we will use it to handle the data
    private RoomRepository roomRepository;

    @PostMapping(path="/add") // Map ONLY POST Requests
    public ResponseEntity<Room> addNewRoom (@RequestBody Room room, @RequestParam(name = "hotelID") int hotelID) {
        try{
            Hotel hotel = roomRepository.findHotelByID(hotelID);
            room.setHotel(hotel);
            Room _room = roomRepository.save(room);
            return new ResponseEntity<>(_room, HttpStatus.CREATED);
        } catch (Exception e){
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping(path="/all")
    public @ResponseBody ResponseEntity<List<Room>> getAllRooms(@RequestParam(name = "number", required = false) Long number) {
        try {
            List<Room> rooms = new ArrayList<Room>();
            if (number == null) {
                rooms.addAll(roomRepository.findAll());
            } else {
                rooms.addAll(roomRepository.findByNumber(Math.toIntExact(number)));
            }
            if (rooms.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(rooms, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping(path="/av")
    public @ResponseBody ResponseEntity<List<Room>> getAvailableRooms(@RequestBody RoomAvailibility roomAvailibility, HttpServletRequest request) {

        System.out.println(roomAvailibility.getStartDate().toString());
        return new ResponseEntity<>(roomRepository.findAll(), HttpStatus.OK);
    }
}