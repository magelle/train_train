defmodule TrainTrainWeb.TicketController do
  use TrainTrainWeb, :controller

  alias TrainTicket.Commands.Create
  alias TrainTicket.TicketOffice
  alias TrainTicket.TrainTicketProjection

  def index(conn, _params) do
    tickets = TicketOffice.list_tickets()
    render(conn, "index.html", tickets: tickets)
  end

  def new(conn, _params) do
    ticket = TicketOffice.init_ticket(%TrainTicketProjection{uuid: nil, name: ""})
    changeset = %Plug.Conn{params: ticket}
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"uuid" => uuid, "name" => name}) do
    case TicketOffice.create_ticket(%Create{uuid: uuid, name: name}) do
      :ok ->
        conn
        |> put_flash(:info, "Ticket created successfully.")
        |> redirect(to: Routes.ticket_path(conn, :show, uuid))

      {:error, :already_created} ->
        changeset = %Plug.Conn{params: %{}}
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => uuid}) do
    ticket = TicketOffice.get_ticket!(uuid)
    render(conn, "show.html", ticket: ticket)
  end

  def edit(conn, %{"id" => uuid}) do
    ticket = TicketOffice.get_ticket!(uuid)
    changeset = %Plug.Conn{params: TicketOffice.init_ticket(ticket)}
    render(conn, "edit.html", ticket: ticket, changeset: changeset)
  end

  def update(conn, %{"id" => uuid, "ticket" => ticket_params}) do
    #    ticket = TicketOffice.get_ticket!(uuid)
    #
    #    case TicketOffice.update_ticket(ticket, ticket_params) do
    #      {:ok, ticket} ->
    #        conn
    #        |> put_flash(:info, "Ticket updated successfully.")
    #        |> redirect(to: Routes.ticket_path(conn, :show, ticket))
    #
    #      {:error, %Ecto.Changeset{} = changeset} ->
    #        render(conn, "edit.html", ticket: ticket, changeset: changeset)
    #    end
  end

  def delete(conn, %{"id" => uuid}) do
    ticket = TicketOffice.get_ticket!(uuid)
    :ok = TicketOffice.delete_ticket(ticket)

    conn
    |> put_flash(:info, "Ticket deleted successfully.")
    |> redirect(to: Routes.ticket_path(conn, :index))
  end
end
