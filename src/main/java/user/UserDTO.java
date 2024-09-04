package user;

import lombok.Getter;
import lombok.NonNull;
import lombok.Setter;

@Getter
@Setter
public class UserDTO {
    @NonNull
    private String userId;
    @NonNull
    private String userPassword;
    private String userEmail;
}
