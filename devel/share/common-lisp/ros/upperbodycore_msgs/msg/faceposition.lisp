; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-msg)


;//! \htmlinclude faceposition.msg.html

(cl:defclass <faceposition> (roslisp-msg-protocol:ros-message)
  ((number_of_person
    :reader number_of_person
    :initarg :number_of_person
    :type cl:integer
    :initform 0)
   (faces_position
    :reader faces_position
    :initarg :faces_position
    :type (cl:vector upperbodycore_msgs-msg:facepos)
   :initform (cl:make-array 0 :element-type 'upperbodycore_msgs-msg:facepos :initial-element (cl:make-instance 'upperbodycore_msgs-msg:facepos))))
)

(cl:defclass faceposition (<faceposition>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <faceposition>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'faceposition)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-msg:<faceposition> is deprecated: use upperbodycore_msgs-msg:faceposition instead.")))

(cl:ensure-generic-function 'number_of_person-val :lambda-list '(m))
(cl:defmethod number_of_person-val ((m <faceposition>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:number_of_person-val is deprecated.  Use upperbodycore_msgs-msg:number_of_person instead.")
  (number_of_person m))

(cl:ensure-generic-function 'faces_position-val :lambda-list '(m))
(cl:defmethod faces_position-val ((m <faceposition>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:faces_position-val is deprecated.  Use upperbodycore_msgs-msg:faces_position instead.")
  (faces_position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <faceposition>) ostream)
  "Serializes a message object of type '<faceposition>"
  (cl:let* ((signed (cl:slot-value msg 'number_of_person)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'faces_position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'faces_position))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <faceposition>) istream)
  "Deserializes a message object of type '<faceposition>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'number_of_person) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'faces_position) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'faces_position)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'upperbodycore_msgs-msg:facepos))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<faceposition>)))
  "Returns string type for a message object of type '<faceposition>"
  "upperbodycore_msgs/faceposition")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'faceposition)))
  "Returns string type for a message object of type 'faceposition"
  "upperbodycore_msgs/faceposition")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<faceposition>)))
  "Returns md5sum for a message object of type '<faceposition>"
  "c57707684497960dcf18b4bf64945b78")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'faceposition)))
  "Returns md5sum for a message object of type 'faceposition"
  "c57707684497960dcf18b4bf64945b78")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<faceposition>)))
  "Returns full string definition for message of type '<faceposition>"
  (cl:format cl:nil "int32 number_of_person~%facepos[] faces_position~%~%================================================================================~%MSG: upperbodycore_msgs/facepos~%float64 x~%float64 y ~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'faceposition)))
  "Returns full string definition for message of type 'faceposition"
  (cl:format cl:nil "int32 number_of_person~%facepos[] faces_position~%~%================================================================================~%MSG: upperbodycore_msgs/facepos~%float64 x~%float64 y ~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <faceposition>))
  (cl:+ 0
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'faces_position) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <faceposition>))
  "Converts a ROS message object to a list"
  (cl:list 'faceposition
    (cl:cons ':number_of_person (number_of_person msg))
    (cl:cons ':faces_position (faces_position msg))
))
