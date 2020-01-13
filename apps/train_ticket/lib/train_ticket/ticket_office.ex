defmodule TrainTicket.TicketOffice do
  alias TrainTicket.Application
  alias TrainTicket.Commands.Create
  alias TrainTicket.Repo
  alias TrainTicket.TrainTicketProjection

  @typedoc """
   a uuid, e.g. eb0ecdb1-06af-4644-8f5e-4b9ce69594d8
  """
  @type id :: String.t()

  @spec list_tickets() :: [%TrainTicketProjection{}]
  def list_tickets() do
    Repo.all(TrainTicketProjection)
  end

  def create_ticket(%Create{} = create) do
    Application.dispatch(create, consistency: :strong)
  end

  @spec get_ticket!(id) :: %TrainTicketProjection{}
  def get_ticket!(uuid) do
    Repo.get!(TrainTicketProjection, uuid)
  end

  def update_ticket(_uuid, _ticket) do
  end

  def delete_ticket(ticket) do
    Repo.delete(ticket)
    :ok
  end

  @spec init_ticket(%TrainTicketProjection{}) :: %Create{}
  def init_ticket(%TrainTicketProjection{uuid: uuid, name: name}) do
    %Create{uuid: uuid, name: name}
  end
end
