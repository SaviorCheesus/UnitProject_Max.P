class Surfaces
{
  float _x, _y, _z, _depth, _vertical, _horizontal;
  color _colour;
  
  Surfaces(float x, float y, float z, 
  float depth, float vertical, float horizontal,
  color colour)
  {
    _x = x;
    _y = y;
    _z = z;
    
    _depth = depth;
    _vertical = vertical;
    _horizontal= horizontal;
    _colour = colour;
  }
  
  
  void Display()
  {
    fill(_colour);
    
    stroke(_colour -40);
    
    translate(_x, _y, _z);
    box(_depth, _vertical, _horizontal);
    translate(-_x, -_y, -_z);
    
    Collisions();
  }
  
  private void Collisions()
  {
    if(cam.position.x <= _x +(_depth/2) +10 && cam.position.x >= _x +(_depth/2) -10
    && cam.position.z <= _z +(_horizontal/2) && cam.position.z >= _z -(_horizontal/2)
    && cam.position.y <= _y +(_vertical/2) && cam.position.y >= _y -(_vertical/2))
    {
      cam.position.x = _x +(_depth/2) +11;
    }
    
    if(cam.position.x <= _x -(_depth/2) +10 && cam.position.x >= _x -(_depth/2) -10
    && cam.position.z <= _z +(_horizontal/2) && cam.position.z >= _z -(_horizontal/2)
    && cam.position.y <= _y +(_vertical/2) && cam.position.y >= _y -(_vertical/2))
    {
      cam.position.x = _x -(_depth/2) -11;
    }

    if(cam.position.x <= _x +(_depth/2) && cam.position.x >= _x -(_depth/2) 
    && cam.position.z <= _z -(_horizontal/2) +10 && cam.position.z >= _z -(_horizontal/2) -10
    && cam.position.y <= _y +(_vertical/2) && cam.position.y >= _y -(_vertical/2))
    {
      cam.position.z = _z -(_horizontal/2) -11;
    }
    
    if(cam.position.x <= _x +(_depth/2) && cam.position.x >= _x -(_depth/2)
    && cam.position.z <= _z +(_horizontal/2) +10 && cam.position.z >= _z +(_horizontal/2) -10
    && cam.position.y <= _y +(_vertical/2) && cam.position.y >= _y -(_vertical/2))
    {
      cam.position.z = _z +(_horizontal/2) +11;
    }
    
    if(cam.position.x <= _x +(_depth/2) && cam.position.x >= _x -(_depth/2)
    && cam.position.z <= _z +(_horizontal/2) && cam.position.z >= _z -(_horizontal/2)
    && cam.position.y <= _y -(_vertical/2) && cam.position.y >= _y -(_vertical/2) -50)
    {
      pAcceleration.y = pAcceleration.y * 0;
      pVelocity.y = -1;
    }
  }
}