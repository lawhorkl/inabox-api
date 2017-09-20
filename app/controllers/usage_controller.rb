class UsageController < ApplicationController
  
  def index
    usage_stats = Vmstat.snapshot
    render json: usage_stats, status: :ok
  end

  def memory
    memory_stats = Vmstat.snapshot.memory
    render json: memory_stats, status: :ok
  end

  def cpu
    cpu_stats = Vmstat.snapshot.cpus
    render json: cpu_stats, status: :ok
  end

  def disk
    disk_stats = Vmstat.snapshot.disks
    render json: disk_stats, status: :ok
  end

end
