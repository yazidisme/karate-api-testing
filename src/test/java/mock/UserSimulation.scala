package mock

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._

class UserSimulation extends Simulation {

  val protocol = karateProtocol(
    "/posts" -> Nil
  )

  val create = scenario("Create Post").exec(karateFeature("classpath:posts/features/post-create.feature@Performance"))

  setUp(
    create.inject(atOnceUsers(50))
      .protocols(protocol)
  )
}
