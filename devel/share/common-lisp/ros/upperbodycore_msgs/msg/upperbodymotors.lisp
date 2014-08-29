; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-msg)


;//! \htmlinclude upperbodymotors.msg.html

(cl:defclass <upperbodymotors> (roslisp-msg-protocol:ros-message)
  ((shoulder_yawm_position
    :reader shoulder_yawm_position
    :initarg :shoulder_yawm_position
    :type cl:integer
    :initform 0)
   (shoulder_pitchm_position
    :reader shoulder_pitchm_position
    :initarg :shoulder_pitchm_position
    :type cl:integer
    :initform 0)
   (shoulder_roll_position
    :reader shoulder_roll_position
    :initarg :shoulder_roll_position
    :type cl:integer
    :initform 0)
   (elbow_pitch_position
    :reader elbow_pitch_position
    :initarg :elbow_pitch_position
    :type cl:integer
    :initform 0)
   (elbow_roll_position
    :reader elbow_roll_position
    :initarg :elbow_roll_position
    :type cl:integer
    :initform 0)
   (wrist_pitch_position
    :reader wrist_pitch_position
    :initarg :wrist_pitch_position
    :type cl:integer
    :initform 0)
   (wrist_roll_position
    :reader wrist_roll_position
    :initarg :wrist_roll_position
    :type cl:integer
    :initform 0)
   (gripper_position
    :reader gripper_position
    :initarg :gripper_position
    :type cl:integer
    :initform 0)
   (shoulder_yawm_speed
    :reader shoulder_yawm_speed
    :initarg :shoulder_yawm_speed
    :type cl:integer
    :initform 0)
   (shoulder_pitchm_speed
    :reader shoulder_pitchm_speed
    :initarg :shoulder_pitchm_speed
    :type cl:integer
    :initform 0)
   (shoulder_roll_speed
    :reader shoulder_roll_speed
    :initarg :shoulder_roll_speed
    :type cl:integer
    :initform 0)
   (elbow_pitch_speed
    :reader elbow_pitch_speed
    :initarg :elbow_pitch_speed
    :type cl:integer
    :initform 0)
   (elbow_roll_speed
    :reader elbow_roll_speed
    :initarg :elbow_roll_speed
    :type cl:integer
    :initform 0)
   (wrist_pitch_speed
    :reader wrist_pitch_speed
    :initarg :wrist_pitch_speed
    :type cl:integer
    :initform 0)
   (wrist_roll_speed
    :reader wrist_roll_speed
    :initarg :wrist_roll_speed
    :type cl:integer
    :initform 0)
   (gripper_speed
    :reader gripper_speed
    :initarg :gripper_speed
    :type cl:integer
    :initform 0)
   (head_yaw_position
    :reader head_yaw_position
    :initarg :head_yaw_position
    :type cl:integer
    :initform 0)
   (head_yaw_speed
    :reader head_yaw_speed
    :initarg :head_yaw_speed
    :type cl:integer
    :initform 0)
   (head_pitch_position
    :reader head_pitch_position
    :initarg :head_pitch_position
    :type cl:integer
    :initform 0)
   (head_pitch_speed
    :reader head_pitch_speed
    :initarg :head_pitch_speed
    :type cl:integer
    :initform 0))
)

(cl:defclass upperbodymotors (<upperbodymotors>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <upperbodymotors>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'upperbodymotors)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-msg:<upperbodymotors> is deprecated: use upperbodycore_msgs-msg:upperbodymotors instead.")))

(cl:ensure-generic-function 'shoulder_yawm_position-val :lambda-list '(m))
(cl:defmethod shoulder_yawm_position-val ((m <upperbodymotors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:shoulder_yawm_position-val is deprecated.  Use upperbodycore_msgs-msg:shoulder_yawm_position instead.")
  (shoulder_yawm_position m))

(cl:ensure-generic-function 'shoulder_pitchm_position-val :lambda-list '(m))
(cl:defmethod shoulder_pitchm_position-val ((m <upperbodymotors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:shoulder_pitchm_position-val is deprecated.  Use upperbodycore_msgs-msg:shoulder_pitchm_position instead.")
  (shoulder_pitchm_position m))

(cl:ensure-generic-function 'shoulder_roll_position-val :lambda-list '(m))
(cl:defmethod shoulder_roll_position-val ((m <upperbodymotors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:shoulder_roll_position-val is deprecated.  Use upperbodycore_msgs-msg:shoulder_roll_position instead.")
  (shoulder_roll_position m))

(cl:ensure-generic-function 'elbow_pitch_position-val :lambda-list '(m))
(cl:defmethod elbow_pitch_position-val ((m <upperbodymotors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:elbow_pitch_position-val is deprecated.  Use upperbodycore_msgs-msg:elbow_pitch_position instead.")
  (elbow_pitch_position m))

(cl:ensure-generic-function 'elbow_roll_position-val :lambda-list '(m))
(cl:defmethod elbow_roll_position-val ((m <upperbodymotors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:elbow_roll_position-val is deprecated.  Use upperbodycore_msgs-msg:elbow_roll_position instead.")
  (elbow_roll_position m))

(cl:ensure-generic-function 'wrist_pitch_position-val :lambda-list '(m))
(cl:defmethod wrist_pitch_position-val ((m <upperbodymotors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:wrist_pitch_position-val is deprecated.  Use upperbodycore_msgs-msg:wrist_pitch_position instead.")
  (wrist_pitch_position m))

(cl:ensure-generic-function 'wrist_roll_position-val :lambda-list '(m))
(cl:defmethod wrist_roll_position-val ((m <upperbodymotors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:wrist_roll_position-val is deprecated.  Use upperbodycore_msgs-msg:wrist_roll_position instead.")
  (wrist_roll_position m))

(cl:ensure-generic-function 'gripper_position-val :lambda-list '(m))
(cl:defmethod gripper_position-val ((m <upperbodymotors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:gripper_position-val is deprecated.  Use upperbodycore_msgs-msg:gripper_position instead.")
  (gripper_position m))

(cl:ensure-generic-function 'shoulder_yawm_speed-val :lambda-list '(m))
(cl:defmethod shoulder_yawm_speed-val ((m <upperbodymotors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:shoulder_yawm_speed-val is deprecated.  Use upperbodycore_msgs-msg:shoulder_yawm_speed instead.")
  (shoulder_yawm_speed m))

(cl:ensure-generic-function 'shoulder_pitchm_speed-val :lambda-list '(m))
(cl:defmethod shoulder_pitchm_speed-val ((m <upperbodymotors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:shoulder_pitchm_speed-val is deprecated.  Use upperbodycore_msgs-msg:shoulder_pitchm_speed instead.")
  (shoulder_pitchm_speed m))

(cl:ensure-generic-function 'shoulder_roll_speed-val :lambda-list '(m))
(cl:defmethod shoulder_roll_speed-val ((m <upperbodymotors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:shoulder_roll_speed-val is deprecated.  Use upperbodycore_msgs-msg:shoulder_roll_speed instead.")
  (shoulder_roll_speed m))

(cl:ensure-generic-function 'elbow_pitch_speed-val :lambda-list '(m))
(cl:defmethod elbow_pitch_speed-val ((m <upperbodymotors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:elbow_pitch_speed-val is deprecated.  Use upperbodycore_msgs-msg:elbow_pitch_speed instead.")
  (elbow_pitch_speed m))

(cl:ensure-generic-function 'elbow_roll_speed-val :lambda-list '(m))
(cl:defmethod elbow_roll_speed-val ((m <upperbodymotors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:elbow_roll_speed-val is deprecated.  Use upperbodycore_msgs-msg:elbow_roll_speed instead.")
  (elbow_roll_speed m))

(cl:ensure-generic-function 'wrist_pitch_speed-val :lambda-list '(m))
(cl:defmethod wrist_pitch_speed-val ((m <upperbodymotors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:wrist_pitch_speed-val is deprecated.  Use upperbodycore_msgs-msg:wrist_pitch_speed instead.")
  (wrist_pitch_speed m))

(cl:ensure-generic-function 'wrist_roll_speed-val :lambda-list '(m))
(cl:defmethod wrist_roll_speed-val ((m <upperbodymotors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:wrist_roll_speed-val is deprecated.  Use upperbodycore_msgs-msg:wrist_roll_speed instead.")
  (wrist_roll_speed m))

(cl:ensure-generic-function 'gripper_speed-val :lambda-list '(m))
(cl:defmethod gripper_speed-val ((m <upperbodymotors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:gripper_speed-val is deprecated.  Use upperbodycore_msgs-msg:gripper_speed instead.")
  (gripper_speed m))

(cl:ensure-generic-function 'head_yaw_position-val :lambda-list '(m))
(cl:defmethod head_yaw_position-val ((m <upperbodymotors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:head_yaw_position-val is deprecated.  Use upperbodycore_msgs-msg:head_yaw_position instead.")
  (head_yaw_position m))

(cl:ensure-generic-function 'head_yaw_speed-val :lambda-list '(m))
(cl:defmethod head_yaw_speed-val ((m <upperbodymotors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:head_yaw_speed-val is deprecated.  Use upperbodycore_msgs-msg:head_yaw_speed instead.")
  (head_yaw_speed m))

(cl:ensure-generic-function 'head_pitch_position-val :lambda-list '(m))
(cl:defmethod head_pitch_position-val ((m <upperbodymotors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:head_pitch_position-val is deprecated.  Use upperbodycore_msgs-msg:head_pitch_position instead.")
  (head_pitch_position m))

(cl:ensure-generic-function 'head_pitch_speed-val :lambda-list '(m))
(cl:defmethod head_pitch_speed-val ((m <upperbodymotors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-msg:head_pitch_speed-val is deprecated.  Use upperbodycore_msgs-msg:head_pitch_speed instead.")
  (head_pitch_speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <upperbodymotors>) ostream)
  "Serializes a message object of type '<upperbodymotors>"
  (cl:let* ((signed (cl:slot-value msg 'shoulder_yawm_position)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'shoulder_pitchm_position)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'shoulder_roll_position)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'elbow_pitch_position)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'elbow_roll_position)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'wrist_pitch_position)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'wrist_roll_position)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'gripper_position)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'shoulder_yawm_speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'shoulder_pitchm_speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'shoulder_roll_speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'elbow_pitch_speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'elbow_roll_speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'wrist_pitch_speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'wrist_roll_speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'gripper_speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'head_yaw_position)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'head_yaw_speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'head_pitch_position)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'head_pitch_speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <upperbodymotors>) istream)
  "Deserializes a message object of type '<upperbodymotors>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'shoulder_yawm_position) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'shoulder_pitchm_position) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'shoulder_roll_position) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'elbow_pitch_position) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'elbow_roll_position) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'wrist_pitch_position) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'wrist_roll_position) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gripper_position) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'shoulder_yawm_speed) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'shoulder_pitchm_speed) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'shoulder_roll_speed) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'elbow_pitch_speed) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'elbow_roll_speed) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'wrist_pitch_speed) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'wrist_roll_speed) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'gripper_speed) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'head_yaw_position) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'head_yaw_speed) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'head_pitch_position) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'head_pitch_speed) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<upperbodymotors>)))
  "Returns string type for a message object of type '<upperbodymotors>"
  "upperbodycore_msgs/upperbodymotors")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'upperbodymotors)))
  "Returns string type for a message object of type 'upperbodymotors"
  "upperbodycore_msgs/upperbodymotors")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<upperbodymotors>)))
  "Returns md5sum for a message object of type '<upperbodymotors>"
  "fffca84754f6d1b715c73f8c10cb67a1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'upperbodymotors)))
  "Returns md5sum for a message object of type 'upperbodymotors"
  "fffca84754f6d1b715c73f8c10cb67a1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<upperbodymotors>)))
  "Returns full string definition for message of type '<upperbodymotors>"
  (cl:format cl:nil "int32 shoulder_yawm_position~%int32 shoulder_pitchm_position~%int32 shoulder_roll_position~%int32 elbow_pitch_position~%int32 elbow_roll_position~%int32 wrist_pitch_position~%int32 wrist_roll_position~%int32 gripper_position~%int32 shoulder_yawm_speed~%int32 shoulder_pitchm_speed~%int32 shoulder_roll_speed~%int32 elbow_pitch_speed~%int32 elbow_roll_speed~%int32 wrist_pitch_speed~%int32 wrist_roll_speed~%int32 gripper_speed~%int32 head_yaw_position~%int32 head_yaw_speed~%int32 head_pitch_position~%int32 head_pitch_speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'upperbodymotors)))
  "Returns full string definition for message of type 'upperbodymotors"
  (cl:format cl:nil "int32 shoulder_yawm_position~%int32 shoulder_pitchm_position~%int32 shoulder_roll_position~%int32 elbow_pitch_position~%int32 elbow_roll_position~%int32 wrist_pitch_position~%int32 wrist_roll_position~%int32 gripper_position~%int32 shoulder_yawm_speed~%int32 shoulder_pitchm_speed~%int32 shoulder_roll_speed~%int32 elbow_pitch_speed~%int32 elbow_roll_speed~%int32 wrist_pitch_speed~%int32 wrist_roll_speed~%int32 gripper_speed~%int32 head_yaw_position~%int32 head_yaw_speed~%int32 head_pitch_position~%int32 head_pitch_speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <upperbodymotors>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <upperbodymotors>))
  "Converts a ROS message object to a list"
  (cl:list 'upperbodymotors
    (cl:cons ':shoulder_yawm_position (shoulder_yawm_position msg))
    (cl:cons ':shoulder_pitchm_position (shoulder_pitchm_position msg))
    (cl:cons ':shoulder_roll_position (shoulder_roll_position msg))
    (cl:cons ':elbow_pitch_position (elbow_pitch_position msg))
    (cl:cons ':elbow_roll_position (elbow_roll_position msg))
    (cl:cons ':wrist_pitch_position (wrist_pitch_position msg))
    (cl:cons ':wrist_roll_position (wrist_roll_position msg))
    (cl:cons ':gripper_position (gripper_position msg))
    (cl:cons ':shoulder_yawm_speed (shoulder_yawm_speed msg))
    (cl:cons ':shoulder_pitchm_speed (shoulder_pitchm_speed msg))
    (cl:cons ':shoulder_roll_speed (shoulder_roll_speed msg))
    (cl:cons ':elbow_pitch_speed (elbow_pitch_speed msg))
    (cl:cons ':elbow_roll_speed (elbow_roll_speed msg))
    (cl:cons ':wrist_pitch_speed (wrist_pitch_speed msg))
    (cl:cons ':wrist_roll_speed (wrist_roll_speed msg))
    (cl:cons ':gripper_speed (gripper_speed msg))
    (cl:cons ':head_yaw_position (head_yaw_position msg))
    (cl:cons ':head_yaw_speed (head_yaw_speed msg))
    (cl:cons ':head_pitch_position (head_pitch_position msg))
    (cl:cons ':head_pitch_speed (head_pitch_speed msg))
))
