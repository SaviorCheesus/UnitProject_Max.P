class Surfaces
{
  float _x, _y, _z, _depth, _vertical, _horizontal;
  
  Surfaces(float x, float y, float z, 
  float depth, float vertical, float horizontal)
  {
    _x = x;
    _y = y;
    _z = z;
    
    _depth = depth;
    _vertical = vertical;
    _horizontal= horizontal;
  }
  
  
  void Display()
  {
    translate(_x, _y, _z);
    box(_depth, _vertical, _horizontal);
    translate(-_x, -_y, -_z);
    
    Collisions();
  }
  
  void Collisions()
  {
    if(cam.position.x <= _x +_depth && cam.position.x >= _x +_depth -10
    && cam.position.z <= _z +(_horizontal/2) && cam.position.z >= _z -(_horizontal/2)
    && cam.position.y <= _y +_vertical && cam.position.y >= _y -(_vertical/2))
    {
      cam.position.x = _x +_depth -1;
    }
    
    if(cam.position.x <= _x -_depth +10 && cam.position.x >= _x -_depth
    && cam.position.z <= _z +(_horizontal/2) && cam.position.z >= _z -(_horizontal/2)
    && cam.position.y <= _y +_vertical && cam.position.y >= _y -(_vertical/2))
    {
      cam.position.x = _x -_depth +1;
    }

    if(cam.position.x <= _x +(_depth/2) && cam.position.x >= _x -(_depth/2)
    && cam.position.z <= _z +_horizontal +20 && cam.position.z >= _z -_horizontal
    && cam.position.y <= _y +_vertical && cam.position.y >= _y -(_vertical/2))
    {
      cam.position.z = _z -_horizontal +1;
    }
    
    if(cam.position.x <= _x +(_depth/2) && cam.position.x >= _x -(_depth/2)
    && cam.position.z <= _z +_horizontal && cam.position.z >= _z +_horizontal -20
    && cam.position.y <= _y +_vertical && cam.position.y >= _y -(_vertical/2))
    {
      cam.position.z = _z +_horizontal -1;
    }
    
    if(cam.position.x <= _x +_depth && cam.position.x >= _x -_depth
    && cam.position.z <= _z +_horizontal && cam.position.z >= _z -_horizontal
    && cam.position.y <= _y -_vertical && cam.position.y >= _y -_vertical -50)
    {
      pAcceleration.y = pAcceleration.y * 0;
      pVelocity.y = -1;
    }
  }
}