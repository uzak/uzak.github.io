for REST api doc:

    @SpringBootApplication
    @EnableSwagger2 

Structure:

    config/
        @Configuration SwaggerConfiguration
        @Autowired 
            TypeResolver
        @Bean
            Docket

    controller/
        @RequestMapping("/post")
        @RestController
        @CrossOrigin("http://localhost:80001")
        @Autowired PostRepository

        @RequestMapping(method = RequestMethod.POST, consumes = MediaType.Application_JSON_VALUE, produces = MediaType.Application_JSON_VALUE)
        @ResponseStatsu(HttpStatus.CREATED)
        public Post save() {postRepository.saveAndFlush(post)}

        @RequestMapping(method = RequestMethod.GET)
        public List<Post> getAll() { postRepository.findAll(); }

    model/
        @Entity (javax.persistence)
        @Data (lombok)
        @Builder (Lombok)
        @NoArgsConstructor @AllArgsConstructor (lombok)

        @Id @GeneratedValue(strategy = GenerationType.AUTO)

    repository/
        @Repository
        public interface PostRepository extends JpaRespository<Post, Integer>
