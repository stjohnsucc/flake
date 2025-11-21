{ config, lib, ... }:
{
  # environment.memoryAllocator.provider = "graphene-hardened";
  environment.memoryAllocator.provider = "graphene-hardened-light";
}
