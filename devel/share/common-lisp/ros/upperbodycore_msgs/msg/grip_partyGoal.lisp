; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-msg)


;//! \htmlinclude grip_partyGoal.msg.html

(cl:defclass <grip_partyGoal> (roslisp-msg-protocol:ros-message)
  ((input
    :reader input
    :initarg :input
    :type cl:string
    :initform "")
   (object1
    :reader object1
    :initarg :object1
    :type cl:string
    :initform "")
   (object2
    :reader object2
    :initarg :object2
    :type cl:string
    :initform "")
   (object3
    :reader object3
    :initarg :object3
    :type cl:string
    :initform ""))
)

(cl:defclass grip_partyGoal (<grip_partyGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <grip_partyGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'grip_partyGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-msg:<grip_partyGoal> is deprecated: use upperbodycore_msgs-msg:grip_partyGoal instead.")))

(cl:ensure-generic-function 'input-val :lambda-list '(m))
(cl:defmethod input-val ((m <grip_partyGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:input-val is deprecated.  Use upperbodycore_msgs-msg:input instead.")
  (input m))

(cl:ensure-generic-function 'object1-val :lambda-list '(m))
(cl:defmethod object1-val ((m <grip_partyGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:object1-val is deprecated.  Use upperbodycore_msgs-msg:object1 instead.")
  (object1 m))

(cl:ensure-generic-function 'object2-val :lambda-list '(m))
(cl:defmethod object2-val ((m <grip_partyGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:object2-val is deprecated.  Use upperbodycore_msgs-msg:object2 instead.")
  (object2 m))

(cl:ensure-generic-function 'object3-val :lambda-list '(m))
(cl:defmethod object3-val ((m <grip_partyGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:object3-val is deprecated.  Use upperbodycore_msgs-msg:object3 instead.")
  (object3 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <grip_partyGoal>) ostream)
  "Serializes a message object of type '<grip_partyGoal>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'input))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'input))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'object1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'object1))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'object2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'object2))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'object3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'object3))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <grip_partyGoal>) istream)
  "Deserializes a message object of type '<grip_partyGoal>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'input) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'input) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'object1) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'object1) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'object2) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'object2) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'object3) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'object3) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<grip_partyGoal>)))
  "Returns string type for a message object of type '<grip_partyGoal>"
  "upperbodycore_msgs/grip_partyGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'grip_partyGoal)))
  "Returns string type for a message object of type 'grip_partyGoal"
  "upperbodycore_msgs/grip_partyGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<grip_partyGoal>)))
  "Returns md5sum for a message object of type '<grip_partyGoal>"
  "20b0ba85943321453eb7e443252d4a76")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'grip_partyGoal)))
  "Returns md5sum for a message object of type 'grip_partyGoal"
  "20b0ba85943321453eb7e443252d4a76")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<grip_partyGoal>)))
  "Returns full string definition for message of type '<grip_partyGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# define the goal~%string input~%string object1~%string object2~%string object3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'grip_partyGoal)))
  "Returns full string definition for message of type 'grip_partyGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# define the goal~%string input~%string object1~%string object2~%string object3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <grip_partyGoal>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'input))
     4 (cl:length (cl:slot-value msg 'object1))
     4 (cl:length (cl:slot-value msg 'object2))
     4 (cl:length (cl:slot-value msg 'object3))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <grip_partyGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'grip_partyGoal
    (cl:cons ':input (input msg))
    (cl:cons ':object1 (object1 msg))
    (cl:cons ':object2 (object2 msg))
    (cl:cons ':object3 (object3 msg))
))
