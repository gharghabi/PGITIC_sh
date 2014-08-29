; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-msg)


;//! \htmlinclude motortorques.msg.html

(cl:defclass <motortorques> (roslisp-msg-protocol:ros-message)
  ((w0_torque
    :reader w0_torque
    :initarg :w0_torque
    :type cl:boolean
    :initform cl:nil)
   (w1_torque
    :reader w1_torque
    :initarg :w1_torque
    :type cl:boolean
    :initform cl:nil)
   (w2_torque
    :reader w2_torque
    :initarg :w2_torque
    :type cl:boolean
    :initform cl:nil)
   (zm_torque
    :reader zm_torque
    :initarg :zm_torque
    :type cl:boolean
    :initform cl:nil)
   (right_shoulder_torque
    :reader right_shoulder_torque
    :initarg :right_shoulder_torque
    :type cl:boolean
    :initform cl:nil)
   (left_shoulder_torque
    :reader left_shoulder_torque
    :initarg :left_shoulder_torque
    :type cl:boolean
    :initform cl:nil)
   (right_elbow_torque
    :reader right_elbow_torque
    :initarg :right_elbow_torque
    :type cl:boolean
    :initform cl:nil)
   (left_elbow_torque
    :reader left_elbow_torque
    :initarg :left_elbow_torque
    :type cl:boolean
    :initform cl:nil)
   (right_wrist_torque
    :reader right_wrist_torque
    :initarg :right_wrist_torque
    :type cl:boolean
    :initform cl:nil)
   (left_wrist_torque
    :reader left_wrist_torque
    :initarg :left_wrist_torque
    :type cl:boolean
    :initform cl:nil)
   (right_hand_torque
    :reader right_hand_torque
    :initarg :right_hand_torque
    :type cl:boolean
    :initform cl:nil)
   (left_hand_torque
    :reader left_hand_torque
    :initarg :left_hand_torque
    :type cl:boolean
    :initform cl:nil)
   (right_grip0_torque
    :reader right_grip0_torque
    :initarg :right_grip0_torque
    :type cl:boolean
    :initform cl:nil)
   (right_grip1_torque
    :reader right_grip1_torque
    :initarg :right_grip1_torque
    :type cl:boolean
    :initform cl:nil)
   (left_grip_torque
    :reader left_grip_torque
    :initarg :left_grip_torque
    :type cl:boolean
    :initform cl:nil)
   (headpan_torque
    :reader headpan_torque
    :initarg :headpan_torque
    :type cl:boolean
    :initform cl:nil)
   (headtilt_torque
    :reader headtilt_torque
    :initarg :headtilt_torque
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass motortorques (<motortorques>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <motortorques>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'motortorques)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-msg:<motortorques> is deprecated: use upperbodycore_msgs-msg:motortorques instead.")))

(cl:ensure-generic-function 'w0_torque-val :lambda-list '(m))
(cl:defmethod w0_torque-val ((m <motortorques>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:w0_torque-val is deprecated.  Use upperbodycore_msgs-msg:w0_torque instead.")
  (w0_torque m))

(cl:ensure-generic-function 'w1_torque-val :lambda-list '(m))
(cl:defmethod w1_torque-val ((m <motortorques>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:w1_torque-val is deprecated.  Use upperbodycore_msgs-msg:w1_torque instead.")
  (w1_torque m))

(cl:ensure-generic-function 'w2_torque-val :lambda-list '(m))
(cl:defmethod w2_torque-val ((m <motortorques>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:w2_torque-val is deprecated.  Use upperbodycore_msgs-msg:w2_torque instead.")
  (w2_torque m))

(cl:ensure-generic-function 'zm_torque-val :lambda-list '(m))
(cl:defmethod zm_torque-val ((m <motortorques>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:zm_torque-val is deprecated.  Use upperbodycore_msgs-msg:zm_torque instead.")
  (zm_torque m))

(cl:ensure-generic-function 'right_shoulder_torque-val :lambda-list '(m))
(cl:defmethod right_shoulder_torque-val ((m <motortorques>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:right_shoulder_torque-val is deprecated.  Use upperbodycore_msgs-msg:right_shoulder_torque instead.")
  (right_shoulder_torque m))

(cl:ensure-generic-function 'left_shoulder_torque-val :lambda-list '(m))
(cl:defmethod left_shoulder_torque-val ((m <motortorques>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:left_shoulder_torque-val is deprecated.  Use upperbodycore_msgs-msg:left_shoulder_torque instead.")
  (left_shoulder_torque m))

(cl:ensure-generic-function 'right_elbow_torque-val :lambda-list '(m))
(cl:defmethod right_elbow_torque-val ((m <motortorques>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:right_elbow_torque-val is deprecated.  Use upperbodycore_msgs-msg:right_elbow_torque instead.")
  (right_elbow_torque m))

(cl:ensure-generic-function 'left_elbow_torque-val :lambda-list '(m))
(cl:defmethod left_elbow_torque-val ((m <motortorques>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:left_elbow_torque-val is deprecated.  Use upperbodycore_msgs-msg:left_elbow_torque instead.")
  (left_elbow_torque m))

(cl:ensure-generic-function 'right_wrist_torque-val :lambda-list '(m))
(cl:defmethod right_wrist_torque-val ((m <motortorques>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:right_wrist_torque-val is deprecated.  Use upperbodycore_msgs-msg:right_wrist_torque instead.")
  (right_wrist_torque m))

(cl:ensure-generic-function 'left_wrist_torque-val :lambda-list '(m))
(cl:defmethod left_wrist_torque-val ((m <motortorques>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:left_wrist_torque-val is deprecated.  Use upperbodycore_msgs-msg:left_wrist_torque instead.")
  (left_wrist_torque m))

(cl:ensure-generic-function 'right_hand_torque-val :lambda-list '(m))
(cl:defmethod right_hand_torque-val ((m <motortorques>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:right_hand_torque-val is deprecated.  Use upperbodycore_msgs-msg:right_hand_torque instead.")
  (right_hand_torque m))

(cl:ensure-generic-function 'left_hand_torque-val :lambda-list '(m))
(cl:defmethod left_hand_torque-val ((m <motortorques>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:left_hand_torque-val is deprecated.  Use upperbodycore_msgs-msg:left_hand_torque instead.")
  (left_hand_torque m))

(cl:ensure-generic-function 'right_grip0_torque-val :lambda-list '(m))
(cl:defmethod right_grip0_torque-val ((m <motortorques>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:right_grip0_torque-val is deprecated.  Use upperbodycore_msgs-msg:right_grip0_torque instead.")
  (right_grip0_torque m))

(cl:ensure-generic-function 'right_grip1_torque-val :lambda-list '(m))
(cl:defmethod right_grip1_torque-val ((m <motortorques>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:right_grip1_torque-val is deprecated.  Use upperbodycore_msgs-msg:right_grip1_torque instead.")
  (right_grip1_torque m))

(cl:ensure-generic-function 'left_grip_torque-val :lambda-list '(m))
(cl:defmethod left_grip_torque-val ((m <motortorques>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:left_grip_torque-val is deprecated.  Use upperbodycore_msgs-msg:left_grip_torque instead.")
  (left_grip_torque m))

(cl:ensure-generic-function 'headpan_torque-val :lambda-list '(m))
(cl:defmethod headpan_torque-val ((m <motortorques>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:headpan_torque-val is deprecated.  Use upperbodycore_msgs-msg:headpan_torque instead.")
  (headpan_torque m))

(cl:ensure-generic-function 'headtilt_torque-val :lambda-list '(m))
(cl:defmethod headtilt_torque-val ((m <motortorques>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:headtilt_torque-val is deprecated.  Use upperbodycore_msgs-msg:headtilt_torque instead.")
  (headtilt_torque m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <motortorques>) ostream)
  "Serializes a message object of type '<motortorques>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'w0_torque) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'w1_torque) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'w2_torque) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'zm_torque) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'right_shoulder_torque) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'left_shoulder_torque) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'right_elbow_torque) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'left_elbow_torque) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'right_wrist_torque) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'left_wrist_torque) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'right_hand_torque) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'left_hand_torque) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'right_grip0_torque) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'right_grip1_torque) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'left_grip_torque) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'headpan_torque) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'headtilt_torque) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <motortorques>) istream)
  "Deserializes a message object of type '<motortorques>"
    (cl:setf (cl:slot-value msg 'w0_torque) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'w1_torque) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'w2_torque) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'zm_torque) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'right_shoulder_torque) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'left_shoulder_torque) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'right_elbow_torque) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'left_elbow_torque) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'right_wrist_torque) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'left_wrist_torque) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'right_hand_torque) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'left_hand_torque) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'right_grip0_torque) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'right_grip1_torque) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'left_grip_torque) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'headpan_torque) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'headtilt_torque) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<motortorques>)))
  "Returns string type for a message object of type '<motortorques>"
  "upperbodycore_msgs/motortorques")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'motortorques)))
  "Returns string type for a message object of type 'motortorques"
  "upperbodycore_msgs/motortorques")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<motortorques>)))
  "Returns md5sum for a message object of type '<motortorques>"
  "9224f2acf292cd76e572f0c9f42dc756")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'motortorques)))
  "Returns md5sum for a message object of type 'motortorques"
  "9224f2acf292cd76e572f0c9f42dc756")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<motortorques>)))
  "Returns full string definition for message of type '<motortorques>"
  (cl:format cl:nil "bool w0_torque~%bool w1_torque~%bool w2_torque~%bool zm_torque~%bool right_shoulder_torque~%bool left_shoulder_torque~%bool right_elbow_torque~%bool left_elbow_torque~%bool right_wrist_torque~%bool left_wrist_torque~%bool right_hand_torque~%bool left_hand_torque~%bool right_grip0_torque~%bool right_grip1_torque~%bool left_grip_torque~%bool headpan_torque~%bool headtilt_torque~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'motortorques)))
  "Returns full string definition for message of type 'motortorques"
  (cl:format cl:nil "bool w0_torque~%bool w1_torque~%bool w2_torque~%bool zm_torque~%bool right_shoulder_torque~%bool left_shoulder_torque~%bool right_elbow_torque~%bool left_elbow_torque~%bool right_wrist_torque~%bool left_wrist_torque~%bool right_hand_torque~%bool left_hand_torque~%bool right_grip0_torque~%bool right_grip1_torque~%bool left_grip_torque~%bool headpan_torque~%bool headtilt_torque~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <motortorques>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <motortorques>))
  "Converts a ROS message object to a list"
  (cl:list 'motortorques
    (cl:cons ':w0_torque (w0_torque msg))
    (cl:cons ':w1_torque (w1_torque msg))
    (cl:cons ':w2_torque (w2_torque msg))
    (cl:cons ':zm_torque (zm_torque msg))
    (cl:cons ':right_shoulder_torque (right_shoulder_torque msg))
    (cl:cons ':left_shoulder_torque (left_shoulder_torque msg))
    (cl:cons ':right_elbow_torque (right_elbow_torque msg))
    (cl:cons ':left_elbow_torque (left_elbow_torque msg))
    (cl:cons ':right_wrist_torque (right_wrist_torque msg))
    (cl:cons ':left_wrist_torque (left_wrist_torque msg))
    (cl:cons ':right_hand_torque (right_hand_torque msg))
    (cl:cons ':left_hand_torque (left_hand_torque msg))
    (cl:cons ':right_grip0_torque (right_grip0_torque msg))
    (cl:cons ':right_grip1_torque (right_grip1_torque msg))
    (cl:cons ':left_grip_torque (left_grip_torque msg))
    (cl:cons ':headpan_torque (headpan_torque msg))
    (cl:cons ':headtilt_torque (headtilt_torque msg))
))
