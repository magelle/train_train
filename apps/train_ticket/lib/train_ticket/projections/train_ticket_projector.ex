defmodule TrainTicket.TrainTicketProjector do
  use Commanded.Projections.Ecto,
      application: TrainTicket.Application,
      repo: TrainTicket.Repo,
      name: "TrainTicketProjector",
      consistency: :strong

  project %TrainTicket.Events.Created{uuid: uuid, name: name}, _metadata, fn multi ->
    Ecto.Multi.insert(multi, :train_ticket_projections, %TrainTicket.TrainTicketProjection{uuid: uuid, name: name})
  end

end
