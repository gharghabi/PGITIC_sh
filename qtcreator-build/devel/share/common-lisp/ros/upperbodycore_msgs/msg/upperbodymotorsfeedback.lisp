; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-msg)


;//! \htmlinclude upperbodymotorsfeedback.msg.html

(cl:defclass <upperbodymotorsfeedback> (roslisp-msg-protocol:ros-message)
  ((motorfeedbacks
    :reader motorfeedbacks
    :initarg :motorfeedbacks
    :type (cl:vector upperbodycore_msgs-msg:motorfeedback)
   :initform (cl:make-array 0 :element-type 'upperbodycore_msgs-msg:motorfeedback :initial-element (cl:make-instance 'upperbodycore_msgs-msg:motorfeedback))))
)

(cl:defclass upperbodymotorsfeedback (<upperbodymotorsfeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <upperbodymotorsfeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'upperbodymotorsfeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-msg:<upperbodymotorsfeedback> is deprecated: use upperbodycore_msgs-msg:upperbodymotorsfeedback instead.")))

(cl:ensure-generic-function 'motorfeedbacks-val :lambda-list '(m))
(cl:defmethod motorfeedbacks-val ((m <upperbodymotorsfeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:motorfeedbacks-val is deprecated.  Use upperbodycore_msgs-msg:motorfeedbacks instead.")
  (motorfeedbacks m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <upperbodymotorsfeedback>) ostream)
  "Serializes a message object of type '<upperbodymotorsfeedback>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'motorfeedbacks))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'motorfeedbacks))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <upperbodymotorsfeedback>) istream)
  "Deserializes a message object of type '<upperbodymotorsfeedback>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'motorfeedbacks) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'motorfeedbacks)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'upperbodycore_msgs-msg:motorfeedback))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<upperbodymotorsfeedback>)))
  "Returns string type for a message object of type '<upperbodymotorsfeedback>"
  "upperbodycore_msgs/upperbodymotorsfeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'upperbodymotorsfeedback)))
  "Returns string type for a message object of type 'upperbodymotorsfeedback"
  "upperbodycore_msgs/upperbodymotorsfeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<upperbodymotorsfeedback>)))
  "Returns md5sum for a message object of type '<upperbodymotorsfeedback>"
  "73917b09a0a2f6fb93332ecb105c3eb5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'upperbodymotorsfeedback)))
  "Returns md5sum for a message object of type 'upperbodymotorsfeedback"
  "73917b09a0a2f6fb93332ecb105c3eb5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<upperbodymotorsfeedback>)))
  "Returns full string definition for message of type '<upperbodymotorsfeedback>"
  (cl:format cl:nil "motorfeedback[] motorfeedbacks~%~%================================================================================~%MSG: upperbodycore_msgs/motorfeedback~%int32 speed~%int32 position~%float64 load~%int32 voltage~%int32 temp~%int32 id~%string name~%string status~%int32 min~%int32 max~%int32 init~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'upperbodymotorsfeedback)))
  "Returns full string definition for message of type 'upperbodymotorsfeedback"
  (cl:format cl:nil "motorfeedback[] motorfeedbacks~%~%================================================================================~%MSG: upperbodycore_msgs/motorfeedback~%int32 speed~%int32 position~%float64 load~%int32 voltage~%int32 temp~%int32 id~%string name~%string status~%int32 min~%int32 max~%int32 init~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <upperbodymotorsfeedback>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'motorfeedbacks) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <upperbodymotorsfeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'upperbodymotorsfeedback
    (cl:cons ':motorfeedbacks (motorfeedbacks msg))
))
