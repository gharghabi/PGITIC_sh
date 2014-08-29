; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-msg)


;//! \htmlinclude GestureDetect.msg.html

(cl:defclass <GestureDetect> (roslisp-msg-protocol:ros-message)
  ((right_hand
    :reader right_hand
    :initarg :right_hand
    :type cl:string
    :initform "")
   (right_foot
    :reader right_foot
    :initarg :right_foot
    :type cl:string
    :initform "")
   (left_hand
    :reader left_hand
    :initarg :left_hand
    :type cl:string
    :initform "")
   (left_foot
    :reader left_foot
    :initarg :left_foot
    :type cl:string
    :initform ""))
)

(cl:defclass GestureDetect (<GestureDetect>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GestureDetect>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GestureDetect)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-msg:<GestureDetect> is deprecated: use upperbodycore_msgs-msg:GestureDetect instead.")))

(cl:ensure-generic-function 'right_hand-val :lambda-list '(m))
(cl:defmethod right_hand-val ((m <GestureDetect>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:right_hand-val is deprecated.  Use upperbodycore_msgs-msg:right_hand instead.")
  (right_hand m))

(cl:ensure-generic-function 'right_foot-val :lambda-list '(m))
(cl:defmethod right_foot-val ((m <GestureDetect>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:right_foot-val is deprecated.  Use upperbodycore_msgs-msg:right_foot instead.")
  (right_foot m))

(cl:ensure-generic-function 'left_hand-val :lambda-list '(m))
(cl:defmethod left_hand-val ((m <GestureDetect>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:left_hand-val is deprecated.  Use upperbodycore_msgs-msg:left_hand instead.")
  (left_hand m))

(cl:ensure-generic-function 'left_foot-val :lambda-list '(m))
(cl:defmethod left_foot-val ((m <GestureDetect>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:left_foot-val is deprecated.  Use upperbodycore_msgs-msg:left_foot instead.")
  (left_foot m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GestureDetect>) ostream)
  "Serializes a message object of type '<GestureDetect>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'right_hand))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'right_hand))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'right_foot))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'right_foot))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'left_hand))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'left_hand))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'left_foot))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'left_foot))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GestureDetect>) istream)
  "Deserializes a message object of type '<GestureDetect>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'right_hand) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'right_hand) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'right_foot) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'right_foot) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'left_hand) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'left_hand) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'left_foot) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'left_foot) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GestureDetect>)))
  "Returns string type for a message object of type '<GestureDetect>"
  "upperbodycore_msgs/GestureDetect")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GestureDetect)))
  "Returns string type for a message object of type 'GestureDetect"
  "upperbodycore_msgs/GestureDetect")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GestureDetect>)))
  "Returns md5sum for a message object of type '<GestureDetect>"
  "7336518b95568fda1facb2f004bb37a0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GestureDetect)))
  "Returns md5sum for a message object of type 'GestureDetect"
  "7336518b95568fda1facb2f004bb37a0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GestureDetect>)))
  "Returns full string definition for message of type '<GestureDetect>"
  (cl:format cl:nil "string right_hand~%string right_foot~%string left_hand~%string left_foot~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GestureDetect)))
  "Returns full string definition for message of type 'GestureDetect"
  (cl:format cl:nil "string right_hand~%string right_foot~%string left_hand~%string left_foot~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GestureDetect>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'right_hand))
     4 (cl:length (cl:slot-value msg 'right_foot))
     4 (cl:length (cl:slot-value msg 'left_hand))
     4 (cl:length (cl:slot-value msg 'left_foot))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GestureDetect>))
  "Converts a ROS message object to a list"
  (cl:list 'GestureDetect
    (cl:cons ':right_hand (right_hand msg))
    (cl:cons ':right_foot (right_foot msg))
    (cl:cons ':left_hand (left_hand msg))
    (cl:cons ':left_foot (left_foot msg))
))
