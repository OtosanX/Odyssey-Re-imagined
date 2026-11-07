import { GameState } from "../game-state";
import { Client } from "../../server/client";
import { Message } from '../../shared';

export abstract class System {
  constructor(protected game: GameState) { }
  public abstract process(msg: Message, client: Client)
}
