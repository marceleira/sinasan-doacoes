dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
//    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
    singleSession = true // configure OSIV singleSession mode
}

// environment specific settings
environments {
    development {
        dataSource {
            username = "sinasan"
            password = "app"
            dbCreate = "update"
//            dbCreate = "none"
//            dbCreate = "create-drop"
            url = "jdbc:mysql://localhost:3306/sinasan?useUnicode=true&autoReconnect=true"
        }
    }
    test {
        dataSource {
            username = "sinasan"
            password = "app"
            dbCreate = "none"
            url = "jdbc:mysql://localhost:3306/sinasan?useUnicode=true&autoReconnect=true"
        }
    }
    production {
        dataSource {
            username = "sinasan"
            password = "app"
            dbCreate = "none"
            url = "jdbc:mysql://localhost:3306/sinasan?useUnicode=true&autoReconnect=true"
        }
    }
}
