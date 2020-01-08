defmodule TrainTicket.TicketOffice do
  alias TrainTicket.Application
  alias TrainTicket.Commands.Create
  alias TrainTicket.Repo
  alias TrainTicket.TrainTicketProjection

  def list_tickets() do
    Repo.all(TrainTicketProjection)
  end

  def create_ticket(%Create{uuid: uuid} = create) do
    Application.dispatch(create, consistency: :strong)
  end

  def get_ticket!(uuid) do
    Repo.get!(TrainTicketProjection, uuid)
  end

  def update_ticket(_uuid, _ticket) do
  end

  def delete_ticket(ticket) do
    Repo.delete(ticket)
  end

  def init_ticket(%TrainTicketProjection{uuid: uuid, name: name}) do
    %Create{uuid: uuid, name: name}
  end
end
