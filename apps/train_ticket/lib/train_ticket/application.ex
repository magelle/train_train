defmodule TrainTicket.Application do
  use Commanded.Application,
    otp_app: :train_ticket,
    event_store: [
      adapter: Commanded.EventStore.Adapters.EventStore,
      event_store: TrainTicket.EventStore
    ],
    pubsub: :local,
    registry: :local

  router(TrainTicket.Router)
end
